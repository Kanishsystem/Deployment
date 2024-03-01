<?php

namespace Site\Controller;

use Core\BaseController;
use Core\Helpers\SmartFileHelper;
use Core\Helpers\SmartAuthHelper;
use Site\Helpers\ACVShutDownHelper;
use Core\Helpers\SmartData as Data;


class ACVShutDownController extends BaseController
{
    private ACVShutDownHelper $_acv_shutdown_helper;

    function __construct($params)
    {
        parent::__construct($params);
        // 
        $this->_acv_shutdown_helper = new ACVShutDownHelper($this->db);
    }

    /**
     * 
     */
    public function insert()
    {
        $columns = ["from_date","to_date","from_time","to_time", "description"];
        // do validations
        $this->_acv_shutdown_helper->validate(ACVShutDownHelper::validations, $columns, $this->post);
        // add other columns
        $this->post["from_date"] = Data::post_data("from_date", "DATE");
        $this->post["to_date"] = Data::post_data("to_date", "DATE");
        $columns[] = "created_time";
        $columns[] = "sd_mt_userdb_id";
        $columns[] = "status";
        $this->post["status"] = 10;
        // begin transation
        $this->db->_db->Begin();
        // insert and get id
        $id = $this->_acv_shutdown_helper->insert($columns, $this->post);
         // upload the document
         $file_path = $this->_acv_shutdown_helper->getFullFile($id);
         if( isset($_FILES["uploaded_file"])){
         // move the uploaded file to path 
         $stored_file_path = SmartFileHelper::moveSingleFile("uploaded_file",$file_path);
         // update the file path in table
         $update_columns = ["location"];
         $update_data = ["location"=>$stored_file_path];
         $this->_acv_shutdown_helper->update($update_columns,$update_data,$id);   
         } 
           // commit the transaction and 
        $this->db->_db->commit();
        // add log
        $this->addLog("ADDED A WORKSHOP DOC", "", SmartAuthHelper::getLoggedInUserName());
        //
        $this->response($id);
    }
    /**
     * 
     */
    public function update()
    {
        $id = isset($this->post["id"]) ? intval($this->post["id"]) : 0;
        if ($id < 1) {
            \CustomErrorHandler::triggerInvalid("Invalid ID");
        }
        $valid_columns = ["status"];
       
        // do validations
        $this->_acv_shutdown_helper->validate(ACVShutDownHelper::validations, $valid_columns, $this->post);
        $columns = ["status","admin_remarks"];
        // add columns
        $columns[] = "last_modified_by";
        $columns[] = "last_modified_time";
        // insert and get id
        $id = $this->_acv_shutdown_helper->update($columns, $this->post, $id);
        // add log
        $this->addLog("UPDATED A WORKSHOP DOC", "", SmartAuthHelper::getLoggedInUserName());
        $this->response($id);
    }

    private function file_check($id){
        $pdf_path =  $this->_acv_shutdown_helper->getFullFile($id) .".pdf";
        return file_exists(SmartFileHelper::getDataPath()  . $pdf_path) ? true : false;
    }

    public function getAll()
    {
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
            case 'admin':
                $sql = "status IN (".implode(",", $status).")";
                break;
            default:
                break;
        } 
        $data = $this->_acv_shutdown_helper->getAllData($sql, $data_in);
        $out = [];
        foreach($data as $obj){
            $obj->file_check = $this->file_check($obj->ID);
            $out[] = $obj;
        }
        $this->response($out);
    }
    /**
     * 
     */
    public function getOne()
    {
        $id = isset($this->post["id"]) ? intval($this->post["id"]) : 0;
        if ($id < 1) {
            \CustomErrorHandler::triggerInvalid("Invalid ID");
        }
        // insert and get id
        $data = $this->_acv_shutdown_helper->getOneData($id);
        $this->response($data);
    }
    /**
     * 
     */
    public function deleteOne()
    {
        $id = isset($this->post["id"]) ? intval($this->post["id"]) : 0;
        if ($id < 1) {
            \CustomErrorHandler::triggerInvalid("Invalid ID");
        }
        // insert and get id
        $this->_acv_shutdown_helper->deleteOneId($id);
        // add log
        $this->addLog("DELETED A WORKSHOP DOC", "", SmartAuthHelper::getLoggedInUserName());
        //
        $out = new \stdClass();
        $out->msg = "Deleted Successfully";
        $this->response($out);
    }

    
   
}
