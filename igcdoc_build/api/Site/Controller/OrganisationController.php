<?php 

namespace Site\Controller;

use Core\BaseController;

use Core\Helpers\SmartAuthHelper;
use Site\Helpers\OrganisationHelper as OrganisationHelper;
use Site\Helpers\UserHelper;


class OrganisationController extends BaseController{
    
    private OrganisationHelper $_org_helper;
    private UserHelper $_user_helper;
    private $_apps = [];

    function __construct($params)
    {
        parent::__construct($params);
        // 
        $this->_org_helper = new OrganisationHelper($this->db);
        // 
        $this->_user_helper = new UserHelper($this->db);
    }

   /**
     * 
     */
    public function insert(){
        $columns = [ "sd_org_name","sd_org_type_id","sd_mt_userdb_id","sd_org_short_label"];
        // do validations
        $this->_org_helper->validate(OrganisationHelper::validations,$columns,$this->post);
        // generate full_label
       
        // add other columns
        $columns[]="sd_org_id";
        $columns[]="sd_org_short_label";
        $columns[]="sd_org_full_label";
        $columns[]="created_by"; 
        $columns[]="created_time"; 
       
        // insert and get id
        $id = $this->_org_helper->insert($columns,$this->post);
        // add log
        $this->addLog("ADDED A MEMBER TO ORGANIZATION","",SmartAuthHelper::getLoggedInUserName());
        //
        $this->response($id);
    }
    /**
     * 
     */
    public function update(){
        $id = isset($this->post["id"]) ? intval($this->post["id"]) : 0;
        if($id < 1){
            \CustomErrorHandler::triggerInvalid("Invalid ID");
        }
        $columns = [ "sd_org_name","sd_org_type_id","sd_org_id","sd_mt_userdb_id"];
        // do validations
        $this->_org_helper->validate(OrganisationHelper::validations,$columns,$this->post);
         // add other columns
         $columns[]="last_modified_time"; 
        // insert and get id
        $this->_org_helper->update($columns,$this->post,$id);
        // add log
        $this->addLog("UPDATED ORGANIZATION MEMBER","",SmartAuthHelper::getLoggedInUserName());
        //
        $this->response($id);
    }

    public function getAll(){      
        $data = $this->_org_helper->getAllData();
        $this->response($data);
    }
    /**
     * 
     */
    public function getAllTree(){   
        $id = isset($this->post["id"]) ? intval($this->post["id"]) : 0;
        $type = $id < 1 ? "INIT": "SECTION";      
        $data =  $this->getSingleTree($id, $type);    
        if($type=="SECTION"){
            $parent_data = $this->_org_helper->getOneData($id);
            $parent_data->children = $data;
            $this->response([$parent_data]);
        }
        $this->response($data);
    }

    private function getSingleTree($id,$type){
        $data_in=["ID" => $id];        
        $sql = "t1.sd_org_id=:ID";
        if($type=="INIT"){
            $sql .= " AND t1.sd_org_type_id > 12";
        }
        $data =  $this->_org_helper->getAllData($sql,$data_in); 
        foreach($data as $key=>$obj){
           $children = $this->getSingleTree($obj->ID,$type);
           if($children){
            $obj->children =  $children;
           }
           $data[$key]=$obj;
        }
        return $data;
    }
    /**
     * 
     */
    public function getAllAssociateParents(){   
        $userid = SmartAuthHelper::getLoggedInUserId();
        $org_id =  $this->_user_helper->getOneDataWithUserId($userid); 
       // var_dump($org_id);
       $this->_apps = [];
        $data = $this->getBackAuthPattern($org_id->sd_org_id);
        $this->response($data);
     }
    /**
     * 
     */
    public function getBackAuthPattern($id){  
         
        $data_in = ["ID" => $id];
        $sql = "t1.ID=:ID";
        $data = $this->_org_helper->getAllAuthParent($sql, $data_in);
        $this->_apps[] = $data;
        if(intval($data->sd_org_id) > 0){
           $this->getBackAuthPattern($data->sd_org_id);
        }
        return $this->_apps;
    } 
    /**
     * 
     */
    public function getOne(){  
        $id = isset($this->post["id"]) ? intval($this->post["id"]) : 0;
        if($id < 1){
            \CustomErrorHandler::triggerInvalid("Invalid ID");
        }
        // insert and get id
        $data = $this->_org_helper->getOneData($id);
        $this->response($data);
    }
    /**
     * 
     */
    public function deleteOne(){  
        $id = isset($this->post["id"]) ? intval($this->post["id"]) : 0;
        if($id < 1){
            \CustomErrorHandler::triggerInvalid("Invalid ID");
        }    
        $orgdb_check = $this->_org_helper->getUserWithChild($id,"org");
        $userdb_check = $this->_org_helper->getUserWithChild($id,"user");
        if(!empty($orgdb_check) || !empty($userdb_check)){
            \CustomErrorHandler::triggerInvalid("can't delete Parent");
        }
        // delete
        $this->_org_helper->deleteOneId($id);
        // add log
        $this->addLog("DELETED A MEMBER FROM ORGANIZATION","",SmartAuthHelper::getLoggedInUserName());
        //
        $out = new \stdClass();
        $out->msg = "Deleted Successfully";
        $this->response($out);
    }
   

    public function getAllParent(){      
        $data = $this->_org_helper->getAllParents();
        $this->response($data);
    }

}