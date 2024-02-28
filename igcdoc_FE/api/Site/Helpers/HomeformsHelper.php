<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace Site\Helpers;

use Core\BaseHelper;
use Core\Helpers\SmartConst;

//
use Site\Helpers\TableHelper as Table;

/**
 * Description of Data
 * 
 *  class helps to get the data from post with specified type 
 *
 * @author kms
 */
class HomeformsHelper extends BaseHelper
{
    const schema = [
        "title" => SmartConst::SCHEMA_VARCHAR,
        "doc_loc" => SmartConst::SCHEMA_VARCHAR,
        "created_by" => SmartConst::SCHEMA_CUSER_ID,
        "created_time" => SmartConst::SCHEMA_CDATETIME,
    ];
    /**
     * 
     */
    const validations = [
      
        "title" => [
            [
                "type" => SmartConst::VALID_REQUIRED,
                "msg" => "Please Enter Tile"
            ],
            [
                "type" => SmartConst::VALID_MAX_LENGTH,
                "max"=>255,
                "msg"=>"Title Max character 255"
            ]
        ],
        "uploaded_file" => [
            [
                "type" => SmartConst::VALID_FILE_REQUIRED,
                "msg" => "Please Upload the Document"
            ],
            [
                "type" => SmartConst::VALID_FILE_TYPE,
                "msg" => "Only pdf is allowed",
                "ext"=>["pdf"]
            ]
        
        ]
    ];
    
     // file handling 
   const FILE_FOLDER = "homeforms";
   const FILE_NAME = "file";
    //
    public function getFullFile($id){
        return self::FILE_FOLDER . DS . $id . DS . self::FILE_NAME;
    }
    /**
     * 
     */
    public function insert(array $columns, array $data)
    {
        return $this->insertDb(self::schema, Table::HOME_FORMS, $columns, $data);
    }
    /**
     * 
     */
    public function update(array $columns, array $data, int $id)
    {
        return $this->updateDb(self::schema, Table::HOME_FORMS, $columns, $data, $id);
    }
    /**
     * 
     */
    public function getAllData($sql = "", $data_in = [], $select_in=[],$group_by = "", $order_by = "", $count = false)
    {
        $from = Table::HOME_FORMS;
        $select = ["*"];
        if(!empty($select_in)){
            $select = $select_in;
        }
        return $this->getAll($select, $from, $sql, $group_by, $order_by, $data_in, false, [], $count);
    }
    /**
     * 
     */
    public function getOneData($id)
    {
        $from = Table::HOME_FORMS;
        $select = ["*"];
        $sql = "ID=:ID";
        $data_in = ["ID" => $id];
        $group_by = "";
        $order_by = "";
        return $this->getAll($select, $from, $sql, $group_by, $order_by, $data_in, true, []);
    }
    /**
     * 
     */
    public function deleteOneId($id)
    {
        $from = Table::HOME_FORMS;
        $this->deleteId($from,$id);
    }
   
    
}
