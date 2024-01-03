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
class CommanComplaintHelper extends BaseHelper
{

    const schema = [
        // complaint types table
        "complaint_type" => SmartConst::SCHEMA_VARCHAR,
        "complaint_admin" => SmartConst::SCHEMA_INTEGER,
        // complaints table
        "type" => SmartConst::SCHEMA_VARCHAR,
        "title" => SmartConst::SCHEMA_VARCHAR,
        "description" => SmartConst::SCHEMA_TEXT,
        "location" => SmartConst::SCHEMA_TEXT,
        "sd_mt_userdb_id" => SmartConst::SCHEMA_CUSER_ID,
        "created_time" => SmartConst::SCHEMA_CDATETIME,
        "app_id" => SmartConst::SCHEMA_INTEGER,
        "status" => SmartConst::SCHEMA_INTEGER,
        "last_modified_by" => SmartConst::SCHEMA_CUSER_ID,
        "last_modified_remarks" => SmartConst::SCHEMA_TEXT,
        "last_modified_time" => SmartConst::SCHEMA_CTIME
        

    ];
    /**
     * 
     */
    const validations = [
        // complaint types table
        "complaint_type" => [
            [
                "type" => SmartConst::VALID_REQUIRED,
                "msg" => "Please Enter Complaint Type"
            ]
        ],
        "complaint_admin" => [
            [
                "type" => SmartConst::VALID_REQUIRED,
                "msg" => "Please Specify the Complaint's Administrator"
            ]
        ],

        // complaints table
        "type" => [
            [
                "type" => SmartConst::VALID_REQUIRED,
                "msg" => "Please Complaint's Type"
            ]
        ],
        "title" => [
            [
                "type" => SmartConst::VALID_REQUIRED,
                "msg" => "Please Enter Title"
            ],
            [
                "type" => SmartConst::VALID_MAX_LENGTH,
                "max" => 1000,
                "msg" => "Title Max character 1000"
            ]
        ],
        "description" => [
            [
                "type" => SmartConst::VALID_REQUIRED,
                "msg" => "Please Enter Description"
            ]
        ],
        "app_id" => [
            [
                "type" => SmartConst::VALID_REQUIRED,
                "msg" => "Please Select Approver"
            ]
        ],
        "location" => [
            [
                "type" => SmartConst::VALID_REQUIRED,
                "msg" => "Please Enter Location"
            ]
        ],
        "status" => [
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
     /*
    -----
    -----
    COMPLAINT TYPES TABLE
    -----
    -----
    */
    
    public function insertComplaintTypes(array $columns, array $data)
    {

        return $this->insertDb(self::schema, Table::COMPLAINTTYPES, $columns, $data);
    }
    /**
     * 
     */
    public function updateComplaintTypes(array $columns, array $data, int $id)
    {
        return $this->updateDb(self::schema, Table::COMPLAINTTYPES, $columns, $data, $id);
    }
    /**
     * 
     */
    public function getAllDataComplaintTypes($sql = "", $data_in = [], $group_by = "", $count = false)
    {
        $from = Table::COMPLAINTTYPES. " t1 LEFT JOIN  ".Table::ROLES." t2 ON t1.complaint_admin=t2.ID" ;
        $select = ["t1.*,t2.role_name AS complaint_admin"];
        $order_by = "created_time DESC";
        $data =  $this->getAll($select, $from, $sql, $group_by, $order_by, $data_in, false, [], $count);
        return $data;
    }
    /**
     * 
     */
    public function getAllDataComplaintTypesDropDown($sql = "", $data_in = [], $group_by = "", $count = false)
    {
        $from = Table::COMPLAINTTYPES;
        $select = ["ID as value,complaint_type as label"];
        $order_by = "created_time DESC";
        return $this->getAll($select, $from, $sql, $group_by, $order_by, $data_in, false, [], $count);
    }
    /**
     * 
     */
    public function getOneDataComplaintTypes($id)
    {
        $from = Table::COMPLAINTTYPES;
        $select = ["*"];
        $sql = "ID=:ID";
        $data_in = ["ID" => $id];
        $group_by = "";
        $order_by = "";
        return $this->getAll($select, $from, $sql, $group_by, $order_by, $data_in, true, []);
    }

    public function getOneDataComplaintTypesWithType($type)
    {
        $from = Table::COMPLAINTTYPES;
        $select = ["*"];
        $sql = "complaint_type=:type";
        $data_in = ["type" => $type];
        $group_by = "";
        $order_by = "";
        return $this->getAll($select, $from, $sql, $group_by, $order_by, $data_in, true, []);
    }
    /**
     * 
     */
    public function checkTypeExist($type)
    {
        $from = Table::COMPLAINTS;
        $select = ["ID"];
        $sql = "type=:type";
        $data_in = ["type" => $type];
        $group_by = "";
        $order_by = "";
        $data_out = $this->getAll($select, $from, $sql, $group_by, $order_by, $data_in, true, []);
        return $data_out;
    }

    public function checkRoleExist($type)
    {
        $from = Table::COMPLAINTTYPES;
        $select = ["ID"];
        $sql = "complaint_admin=:complaint_admin";
        $data_in = ["complaint_admin" => $type];
        $group_by = "";
        $order_by = "";
        $data_out = $this->getAll($select, $from, $sql, $group_by, $order_by, $data_in, true, []);
        return $data_out;
    }
    /**
     * 
     */
    public function deleteOneIdComplaintTypes($id)
    {
        $from = Table::COMPLAINTTYPES;
        $this->deleteId($from, $id);
    }

    public function checkByRoleID($roleId)
    {
        $sql = "complaint_admin=:role";
        $dataIn = ["role" => $roleId];
        $data =  $this->getAllData($sql,$dataIn, "", false);
        return $data;
    }
    /*
    -----
    -----
    COMPLAINT TABLE
    -----
    -----
    */
   
    public function insert(array $columns, array $data)
    {
        return $this->insertDb(self::schema, Table::COMPLAINTS, $columns, $data);
    }
    /**
     * 
     */
    public function update(array $columns, array $data, int $id)
    {
        return $this->updateDb(self::schema, Table::COMPLAINTS, $columns, $data, $id);
    }
    /**
     * 
     */
    public function getAllData($sql = "", $data_in = [], $group_by = "", $count = false)
    {
        $from = Table::COMPLAINTS . " t1 
        INNER JOIN " . Table::USERS . " t2 ON t1.sd_mt_userdb_id = t2.ID";
        $select = ["t1.*,t2.ename as created_by"];
        $order_by = "t1.created_time DESC";
        return $this->getAll($select, $from, $sql, $group_by, $order_by, $data_in, false, [], $count);
    }
    /**
     * 
     */
    public function getOneData($id)
    {
        $from = Table::COMPLAINTS . " t1 
        INNER JOIN " . Table::USERS . " t2 ON t1.sd_mt_userdb_id = t2.ID 
        ";
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
    public function getComplaintWithUserID($id)
    {
        $from = Table::COMPLAINTS;
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
        $from = Table::COMPLAINTS;
        $this->deleteId($from, $id);
    }

    public function getCount($type)
    {
        $sql = "DATE(t1.created_time)=CURRENT_DATE()";
        if ($type == 1) {
            $sql = "MONTH(t1.created_time)=" . SmartGeneral::getMonth();
        } else if ($type == 2) {
            $sql = "YEAR(t1.created_time)=" . SmartGeneral::getYear();
        }
        $data =  $this->getAllData($sql, [], "", true);
        return isset($data) ? count($data) : 0;
    }


    // public function getCountByYear($year)
    // {
    //     $select = ["COUNT(title) AS complaint, MONTH(last_modified_time) AS month,type as complaint_type"];
    //     $from = Table::COMPLAINTS;
    //     $sql = "YEAR(last_modified_time) =:year";
    //     $group_by = "GROUP BY MONTH(last_modified_time)";
    //     $order_by = "month";
    //     $data_in = ["year" => $year];
    //     $count = $this->getAll($select, $from, $sql, $group_by, $order_by, $data_in, false, [], false);
    //     $complaint_count = array_fill(0, 12, 0);
    //     foreach ($count as $comp) {
    //         $month = intval($comp->month);
    //         $compCount = intval($comp->complaint);
    //         $complaint_count[$month - 1] = $compCount;
    //     }
    //     $comp_count_by_year = array_values($complaint_count);
    //     return $comp_count_by_year;
    // }

    
    public function getCountByStatus()
    {
        $sql = "status=10";
        $data =  $this->getAllData($sql,[], "", true);
        return isset($data) ? count($data) : 0;
    }

}
