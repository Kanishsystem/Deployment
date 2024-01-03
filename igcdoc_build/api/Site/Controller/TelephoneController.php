<?php 

namespace Site\Controller;

use Core\BaseController;
use Core\Helpers\SmartGeneral;
use Core\Helpers\SmartAuthHelper;

use Site\Helpers\TelephoneHelper;


class TelephoneController extends BaseController{
    private TelephoneHelper $_telephone_helper;

    function __construct($params)
    {
        parent::__construct($params);
        // 
        $this->_telephone_helper = new TelephoneHelper($this->db);
    }

   /**
     * 
     */
    public function insert(){
        $columns = [ "title","description","telephone_number","location"];
        // do validations
        $this->_telephone_helper->validate(TelephoneHelper::validations,$columns,$this->post);
        // add other columns
        $columns[] = "created_time";
        $columns[] = "sd_mt_userdb_id";
        $columns[] = "status";
        $this->post["status"] = 10;
        // insert and get id
        $id = $this->_telephone_helper->insert($columns,$this->post);
        // add log
        $this->addLog("RAISED A TELEPHONE COMPLAINT","",SmartAuthHelper::getLoggedInUserName());
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
        $columns = ["status"];
        // do validations
        $this->_telephone_helper->validate(TelephoneHelper::validations,$columns,$this->post);
         // add columns
         $columns[] = "last_modified_by";
         $columns[] = "last_modified_time";
        // insert and get id
        $id = $this->_telephone_helper->update($columns,$this->post,$id);
        // add log
        $this->addLog("UPDATED TELEPHONE COMPLAINT","",SmartAuthHelper::getLoggedInUserName());
        $this->response($id);
    }

    public function getAll(){ 
        // check the mode received from router
        $sql = "";
        $data_in = [];
        $mode = isset($this->params["mode"]) ? $this->params["mode"] : "user";
        $status = isset($this->params["status"]) ? $this->params["status"] : [100];
        switch ($mode) {
                // indicates the logged user data
            case 'user':
                $sql = "t1.sd_mt_userdb_id=:user_id";
                $data_in = ["user_id" => SmartAuthHelper::getLoggedInId()];
                break;
            case 'app':
                $sql = "t1.app_id=:user_id AND status IN (".implode(",", $status).")";
                $data_in = ["user_id" => SmartAuthHelper::getLoggedInId()];
                break;
            case 'admin':
                $sql = "status IN (".implode(",", $status).")";
                break;
            default:
                break;
        }
        $data = $this->_telephone_helper->getAllData($sql,$data_in);
        $this->response($data);
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
        $data = $this->_telephone_helper->getOneData($id);
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
        // insert and get id
        $this->_telephone_helper->deleteOneId($id);
        // add log
        $this->addLog("DELETED TELEPHONE COMPLAINT","",SmartAuthHelper::getLoggedInUserName());
        //
        $out = new \stdClass();
        $out->msg = "Deleted Successfully";
        $this->response($out);
    }


    public function updateApp()
    {
        $id = isset($this->post["id"]) ? intval($this->post["id"]) : 0;
        if ($id < 1) {
            \CustomErrorHandler::triggerInvalid("Invalid ID");
        }
        $action = isset($this->post["action"]) ? ($this->post["action"]) : "";
        $columns = ["status","app_time"];
        //
        $dt = ["status"=>$action=="approve" ? 10 : 6];
        // add columns
        $columns[] = "last_modified_by";
        $columns[] = "last_modified_time";
        // insert and get id
        $id = $this->_telephone_helper->update($columns, $dt, $id);
        // add log
        $this->addLog("UPDATED AN TELEPHONE COMPLAINT", "", SmartAuthHelper::getLoggedInUserName());
        $this->response($id);
    }

}