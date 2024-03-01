<?php 

namespace Site\Controller;

use Core\BaseController;
use Core\Helpers\SmartGeneral;
use Core\Helpers\SmartData as Data;
use Core\Helpers\SmartLogger as Logger;
use Site\Helpers\BackupHelper;
use Site\Helpers\MeetRoomHelper;
// site helpers
use Site\Helpers\UserHelper;
use Site\Helpers\UserRoleHelper;
use Site\Helpers\SiteHelper;
use Site\Helpers\CommanComplaintHelper;


class AuthController extends BaseController{

    private UserHelper $_user_helper;
    private UserRoleHelper $_user_role_helper;
    private SiteHelper $_site_helper;
    private MeetRoomHelper $_meet_room_helper;
    private CommanComplaintHelper $_complaint_helper;

    function __construct($params)
    {
        parent::__construct($params);
        // 
        $this->_user_helper = new UserHelper($this->db);
        //
        $this->_user_role_helper = new UserRoleHelper($this->db);
        //
        $this->_site_helper = new SiteHelper($this->db);
        // 
        $this->_meet_room_helper = new MeetRoomHelper($this->db);
        //
        $this->_complaint_helper = new CommanComplaintHelper($this->db);
    }

    private function checkMeetType($role_id){
        $role_memebers = $this->_meet_room_helper->getMeetTypesWithRole($role_id,"member_role_id");
        $roles = [];
        foreach($role_memebers as $obj){
            $roles[] = "SD_" . $obj->type."_MEMBERS";
        }
        $role_admin = $this->_meet_room_helper->getMeetTypesWithRole($role_id,"admin_role_id");
        foreach($role_admin as $obj){
            $roles[] = "SD_" . $obj->type."_ADMIN";
        }
        return $roles;
    }

    private function getRoles($id,$initial){
        $roles = $this->_user_role_helper->getSelectedRolesWithUserId($id);
        $role_names= $initial;
        $electrical_admin_role =  $this->_site_helper->getOneValue("electrical_admin");
        $network_admin_role =  $this->_site_helper->getOneValue("network_admin");
        $telephone_admin_role =  $this->_site_helper->getOneValue("telephone_admin");
        $mechanical_admin_role =  $this->_site_helper->getOneValue("mechanical_admin");
        $workshop_admin_role =  $this->_site_helper->getOneValue("workshop_admin");
        $acv_shutdown_admin_role =  $this->_site_helper->getOneValue("acv_shutdown");
        $elec_shutdown_admin_role =  $this->_site_helper->getOneValue("elec_shutdown");
        // system admin
        $system_admin = $this->_site_helper->getOneValue("system_admin");
       
        foreach($roles as $role){
            $role_names[] = $role->label;
            if($role->value==intval($electrical_admin_role)){
                $role_names[] = "SD_ELE_ADMIN";
            }
            if($role->value==intval($network_admin_role)){
                $role_names[] = "SD_NW_ADMIN";
            }
            if($role->value==intval($telephone_admin_role)){
                $role_names[] = "SD_TP_ADMIN";
            }
            if($role->value==intval($mechanical_admin_role)){
                $role_names[] = "SD_MECH_ADMIN";
            }
            if($role->value==intval($workshop_admin_role)){
                $role_names[] = "SD_WORK_ADMIN";
            }
            if($role->value==intval($acv_shutdown_admin_role)){
                $role_names[] = "SD_ACV_SHUT_ADMIN";
            }
            if($role->value==intval($elec_shutdown_admin_role)){
                $role_names[] = "SD_ELEC_SHUT_ADMIN";
            }
            if($role->value==intval($system_admin)){
                $role_names[] = "ADMIN";
            }
            $complain_data = $this->_complaint_helper->checkRoleExist($role->value);
           // echo "role of employee " . $role->value;
           // var_dump($complain_data);
            if(isset($complain_data->ID)){
                $role_names[] = 'SD_COM_' .$complain_data->ID. '_ADMIN';
            }

            // check for all meets 
            $meet_role = $this->checkMeetType($role->value);
            if(count($meet_role) > 0){
                $role_names = array_merge($role_names,$meet_role);
            }
        } 
       // var_dump($role_names);
        // check for doc status 

       // \CustomErrorHandler::triggerInvalid("Invalid ICNO");
        return $role_names;
    }

    private function get_response($user_data){
        $payload = array(
            "USER" => $user_data
        );   
        // jwt     
        $jwt = SmartGeneral::jwt_encode($payload);
        //    
        $db = new \stdClass();
        $db->accessToken = $jwt;
        $db->ename = $user_data->ename;
        $db->euserid = $user_data->euserid;
        $db->change_pass = $user_data->change_pass;
        $db->expiresInTime=700;
        $db->id = $user_data->ID;
        $db->roles = $user_data->role;
        $roles = ["USER"];
        if($user_data->euserid=="admin"){
            $roles[] = "ADMIN";
        }
        $roles = $this->getRoles($user_data->ID,$roles);
        $db->role =  $roles;
        return $db;
    }

    private function updateVisitorCount(){
        $key = "SITE_VISITOR_COUNT";
        $exists_data = $this->_site_helper->getOneSettingData($key);
        $data = [];
        if(!$exists_data){
            $columns = [ "setting_name","setting_value","created_by"];
            $data["setting_name"] = $key;
            $data["setting_value"] = 1;
            $id = $this->_site_helper->insert($columns,$data);
        }else{
            $id = $exists_data->ID;
            $columns =  [ "setting_value","last_modified_time"];
            $data["setting_value"] = intval($exists_data->setting_value) + 1;
            $this->_site_helper->update($columns,$data,$id);
        }
    }
    /**
     * 
     */
    public function login(){         
        $columns = ["euserid","epassword"];
         // do validations
         $this->_user_helper->validate(UserHelper::validations,$columns,$this->post);
         // take the data
         $userid = Data::post_data("euserid","STRING"); 
         // get the data
         $user_data = $this->_user_helper->getOneDataWithUserId($userid);
         // 
         if(!isset($user_data->ID)){
            \CustomErrorHandler::triggerInvalid("Invalid ICNO");
         }
         // get status
         $status = $user_data->active_status;
         // check failed password attempts
         $this->_user_helper->checkFailedAttempts($user_data); 
         //
         $password = trim($this->post["epassword"]);
         //         
         if($userid!="admin" && !password_verify($password,$user_data->epassword)){
            $this->addLog("INVALID PASSWORD","",$user_data->ename); 
            $this->_user_helper->updateFailedAttempts($user_data); 
            \CustomErrorHandler::triggerInvalid("Invalid Password");
         }
         // check status active or inactive
         if($status!=5){
            $this->addLog("USER LOGGED IN BUT IN ACTIVE","",$user_data->ename);    
            \CustomErrorHandler::triggerInvalid("Status inactive");
         }
        // update the last login time 
        $this->_user_helper->updateLastLogin($user_data->ID); 
        // user data
        $user_data->role = $userid!="admin"? ["USER"]:["ADMIN"];  
        // updating the visitor count
        $this->updateVisitorCount();
        //
        $this->addLog("LOGIN","",$user_data->ename); 
        //
        $user_data->profile_img = ""; 
        // update the visitor count
        $this->_site_helper->updateSiteCount();          
         // pay load             
        $this->response($this->get_response($user_data));  
    }

    public function userReset(){         
        $columns = ["euserid","epassword","confirmPassword"];
         // do validations
         $this->_user_helper->validate(UserHelper::validations,$columns,$this->post);
         // take the data
         $userid = Data::post_data("euserid","STRING"); 
         // get the data
         $user_data = $this->_user_helper->getOneDataWithUserId($userid);
         if(!isset($user_data->ID)){
            \CustomErrorHandler::triggerInvalid("Invalid ICNO");
         }
         $change_pass = $user_data->change_pass;
         //
         if($change_pass > 0 ){
            \CustomErrorHandler::triggerInternalError("Action Restricted");
         }
         //         
         $post_data = ["epassword"=> SmartGeneral::hashPassword($this->post["epassword"])];
         $post_data["change_pass"] = 1;
         $update_columns = ["epassword","change_pass","last_reset_time"];
        //
         $this->_user_helper->update( $update_columns, $post_data,$user_data->ID);
         //
         $user_data->change_pass=1;
        // user data
         $user_data->role = $userid!="admin"? ["USER"]:["ADMIN"];    
         //
         $this->addLog("PASS_RESET","",$user_data->ename);    
         // 
         $user_data->profile_img = "";
        $this->response($this->response($this->get_response($user_data)));  
    }
    /**
     * 
     */
    public function getLog(){
        $year = isset($this->post["year"]) ? intval($this->post["year"]) : SmartGeneral::getYear();
        $month =isset($this->post["month"]) ? intval($this->post["month"]) : SmartGeneral::getMonth();
        $data = Logger::readLogFile($year,$month);
        $this->response($data);
    }

    public function getSiteSettings(){
        $settings = isset($GLOBALS["SD_SITE_SETTINGS"]) ? $GLOBALS["SD_SITE_SETTINGS"] : [];
        $this->response($settings);
    }

    public function takeBackup(){
        $backup = new BackupHelper($this->db);
        $backup_file = "test.sql";
        $backup->doBackUp($backup_file);
    }
   



}