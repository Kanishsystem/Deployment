<?php

namespace Site\Controller;

use Core\BaseController;


use Site\Helpers\HomeImagesHelper as ActivityHelper;
use Core\Helpers\SmartAuthHelper;
use Core\Helpers\SmartFileHelper;

class HomeImagesController extends BaseController
{

    private ActivityHelper $_helper;

    function __construct($params)
    {
        parent::__construct($params);
        // 
        $this->_helper = new ActivityHelper($this->db);
    }

    /**
     * 
     */
    public function insert()
    {
        $valid_columns = ["uploaded_file"];
        // do validations
        $this->_helper->validate(ActivityHelper::validations, $valid_columns, $this->post);
        // add other columns
        //  $columns[]="created_by"; 
        //  $columns[]="created_time"; 
        // insert and get id
        $columns = ["home_image"];
        $id =  $this->_helper->insert($columns, $this->post);

        $file_path = $this->_helper->getFullFile($id);
        // move the uploaded file to path 
        $stored_file_path = SmartFileHelper::moveSingleFile("uploaded_file", $file_path);
       // echo $stored_file_path;
        // update the file path in table
        $update_columns = ["home_image"];
        $update_data = ["home_image" => $stored_file_path];
        $this->_helper->update($update_columns, $update_data, $id);
        // $filename = "../assets/images/test.png";
        //file_put_contents($filename, $this->post["home_image"]);
        //  $this->addLog("INSERTED ACTIVITY","",SmartAuthHelper::getLoggedInUserName());
        $this->response($id);
    }


    public function update()
    {
        $id = isset($this->post["id"]) ? intval($this->post["id"]) : 0;
        if ($id < 1) {
            \CustomErrorHandler::triggerInvalid("Invalid ID");
        }
        $columns = ["uploaded_file"];
        // do validations
        $this->_helper->validate(ActivityHelper::validations, $columns, $this->post);
        // add other columns
        //   $columns[]="last_modified_time";
        // insert and get id
        $file_path = $this->_helper->getFullFile($id);
        // move the uploaded file to path 
        $stored_file_path = SmartFileHelper::moveSingleFile("uploaded_file", $file_path);
       // echo $stored_file_path;
        // update the file path in table
        $update_columns = ["home_image"];
        $update_data = ["home_image" => $stored_file_path];
        $this->_helper->update($update_columns, $update_data, $id);

        $this->addLog("UPDATED ACTIVITY", "", SmartAuthHelper::getLoggedInUserName());
        $this->response($id);
    }

    public function getAll()
    {
        // insert and get id
      
        $data =  $this->_helper->getAllData();
        $this->response($data);
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
        $data =  $this->_helper->getOneData($id);
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
        $this->_helper->deleteOneId($id);
        //
        $this->addLog("DELETED ACTIVITY", "", SmartAuthHelper::getLoggedInUserName());
        $out = new \stdClass();
        $out->msg = "Deleted Successfully";
        $this->response($out);
    }
    /**
     * 
     */
    public function getOneImage()
    {
        $id = isset($this->params["id"]) ? $this->params["id"] : 0;
       
        $data =  $this->_helper->getOneData($id);
        // 
        $pdf_path =  $this->_helper->getFolder($id). $data->home_image;
        // echo $pdf_path;
        $this->responseImage($pdf_path);
       // $final_path = SmartFileHelper::getDataPath().DS . $pdf_path;
      //  $this->responseFileBase64($final_path);
    }

    public function getOneImageNew()
    {
        $id = isset($this->params["id"]) ? $this->params["id"] : 0;
       
        $data =  $this->_helper->getOneData($id);
        // 
        $pdf_path =  $this->_helper->getFolder($id). $data->home_image;
        // echo $pdf_path;
       // $this->responseImage($pdf_path);
        $final_path = SmartFileHelper::getDataPath(). $pdf_path;
        $this->responseFileBase64($final_path);
    }
}
