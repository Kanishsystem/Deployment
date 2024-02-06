<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace Site\Helpers;

use Core\BaseHelper;
use Core\Helpers\SmartConst;
use Core\Helpers\SmartGeneral;

//
use Site\Helpers\TableHelper as Table;

/**
 * Description of Data
 * 
 *  class helps to get the data from post with specified type 
 *
 * @author kms
 */
class NetworkHelper extends BaseHelper
{

    const schema = [
        "title" => SmartConst::SCHEMA_VARCHAR,
        "description" => SmartConst::SCHEMA_TEXT,
        "location" => SmartConst::SCHEMA_TEXT,
        "sd_mt_userdb_id" => SmartConst::SCHEMA_CUSER_ID,
        "app_id" => SmartConst::SCHEMA_INTEGER,
        "created_time" => SmartConst::SCHEMA_CDATETIME,
        "status" => SmartConst::SCHEMA_INTEGER,
        "last_modified_by" => SmartConst::SCHEMA_CUSER_ID,
        "last_modified_remarks" => SmartConst::SCHEMA_TEXT,
        "last_modified_time" => SmartConst::SCHEMA_CTIME
        
    ];
    /**
     * 
     */
    const validations = [
        "title" => [
            [
                "type" => SmartConst::VALID_REQUIRED,
                "msg" => "Please Enter Title"
            ],
            [
                "type" => SmartConst::VALID_MAX_LENGTH,
                "max"=>1000,
                "msg"=>"Title Max character 1000"
            ]
        ],
        "description" => [
            [
                "type" => SmartConst::VALID_REQUIRED,
                "msg" => "Please Enter Description"
            ]
        ],
        "location" => [
            [
                "type" => SmartConst::VALID_REQUIRED,
                "msg" => "Please Enter Location"
            ]
            ],
         "app_id" =>[
            [
                "type" => SmartConst::VALID_REQUIRED,
                "msg" => "Please select Approving Authority"
            ]
        ],
        "status"=> [
            [
                "type" => SmartConst::VALID_REQUIRED,
                "msg" => "Please Enter status"
            ]
            ],
       
        "last_modified_remarks" => [
                            [
                                "type" => SmartConst::VALID_REQUIRED,
                                "msg" => "Please Enter remarks"
                            ]
                            ]
        
    
    ];
    /**
     * 
     */
    public function insert(array $columns, array $data)
    {
        return $this->insertDb(self::schema, Table::NETWORK, $columns, $data);
    }
    /**
     * 
     */
    public function update(array $columns, array $data, int $id)
    {
        return $this->updateDb(self::schema, Table::NETWORK, $columns, $data, $id);
    }
    /**
     * 
     */
    public function getAllData($sql = "", $data_in = [], $group_by = "", $count = false)
    {
        $from = Table::NETWORK . " t1 
        INNER JOIN " . Table::USERS . " t2 ON t1.sd_mt_userdb_id = t2.ID ";
        $select = ["t1.*,t2.ename as created_by"];
        $order_by="t1.created_time DESC";
        return $this->getAll($select, $from, $sql, $group_by, $order_by, $data_in, false, [], $count);
    }
    /**
     * 
     */
    public function getOneData($id)
    {
        $from = Table::NETWORK. " t1 
        INNER JOIN " . Table::USERS . " t2 ON t1.sd_mt_userdb_id = t2.ID ";
        $select = ["t1.*,t2.ename as created_by"];
        $sql = "t1.ID=:ID";
        $data_in = ["ID" => $id];
        $group_by = "";
        $order_by = "";
        return $this->getAll($select, $from, $sql, $group_by, $order_by, $data_in, true, []);
    }
     /**
     * 
     */
    public function getNetWithUserID($id)
    {
        $from = Table::NETWORK;
        $select = ["*"];
        $sql = "sd_mt_userdb_id=:ID";
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
        $from = Table::NETWORK;
        $this->deleteId($from,$id);
    }

    public function getCount($type){
        $sql = "DATE(t1.created_time)=CURRENT_DATE()";
        if($type==1){
            $sql = "MONTH(t1.created_time)=" . SmartGeneral::getMonth();
        }else if($type==2){
            $sql = "YEAR(t1.created_time)=" . SmartGeneral::getYear();
        }
        $data =  $this->getAllData($sql,[],"",true);
        return isset($data) ? count($data) : 0;
    }
   

    public function getCountByYear($year){
        $select = ["COUNT(title) AS network, MONTH(last_modified_time) AS month"];
        $from = Table::NETWORK;
        $sql ="YEAR(last_modified_time) =:year";
        $group_by = "GROUP BY MONTH(last_modified_time)";
        $order_by ="month";
        $data_in =["year" => $year];
        $count = $this->getAll($select, $from, $sql, $group_by, $order_by, $data_in, false, [], false);
        $network_count = array_fill(0, 12, 0);
        foreach ($count as $net) {
            $month = intval($net->month);
            $netCount = intval($net->network);
            $network_count[$month - 1] = $netCount;
        }
        $net_count_by_year = array_values($network_count);
        return $net_count_by_year;
    }
    
    public function getCountByStatus()
    {
        $sql = "status=10";
        $data =  $this->getAllData($sql,[] , "", true);
        return isset($data) ? count($data) : 0;
    }
}
