<?php 

namespace Site\Controller;

use Core\BaseController;
use Core\Helpers\SmartFileHelper;
use Core\Helpers\SmartAuthHelper;
use Site\Helpers\HomeformsHelper;


class HomeformsController extends BaseController{
  
  private HomeformsHelper $_helper;
    function __construct($params)
    {
        parent::__construct($params);
        // 
        $this->_helper = new HomeformsHelper($this->db);
    }

   /**
     * 
     */
    public function insert(){
        $validate_columns = [ "title","uploaded_file"];        
        // do validations
        $this->_helper->validate(HomeformsHelper::validations,$validate_columns,$this->post);
        $columns = [ "title","created_by","created_time"]; 
         // insert and get id
         $id = $this->_helper->insert($columns,$this->post);
          // process the file
        $file_path = $this->_helper->getFullFile($id);
        if( isset($_FILES["uploaded_file"])){
        // move the uploaded file to path 
        $stored_file_path = SmartFileHelper::moveSingleFile("uploaded_file",$file_path);
        // update the file path in table
        $update_columns = ["doc_loc"];
        $update_data = ["doc_loc"=>$stored_file_path];
        $this->_helper->update($update_columns,$update_data,$id);   
        } 
         // add log
        $this->addLog("UPLOADED A LICENSE DOCUMENT ","",SmartAuthHelper::getLoggedInUserName());
        //
         $this->response($id);
    }
    /**
     * 
     */

    public function getAll(){      
        $data = $this->_helper->getAllData();
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
        $data = $this->_helper->getOneData($id);
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
        $this->_helper->deleteOneId($id);
        // add log
        $this->addLog("REMOVED A LICENSE DOCUMENT","",SmartAuthHelper::getLoggedInUserName());
        //
        $out = new \stdClass();
        $out->msg = "Removed Successfully";
    }    
     /**
     * 
     */
    public function getDoc(){
        $id = isset($this->post["id"]) ? $this->post["id"] : 0;
        if($id < 0){
            \CustomErrorHandler::triggerInvalid("Invalid ID");
        }
        $data = $this->_helper->getOneData($id);
        // 
        $pdf_path =  $this->_helper->getFullFile($id) .".pdf";
       // echo $pdf_path;
        $this->responseFileBase64(SmartFileHelper::getDataPath()  . $pdf_path);
    }


}