<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace Site\Routes;

use Core\Helpers\SmartGeneral as General;
use Core\Helpers\SmartConst;

class CommonRouter{

    private $_routes=[];
    private $_admin_only = ["ADMIN","USER"];
    private $_user_only = ["USER"];
    private $_admin_user = ["ADMIN","USER"];

    /**
     * 
     */
    private function auth_routes(){
        $controller = "AuthController";
        $this->_routes["/auth/login"] = [SmartConst::REQUEST_POST,$controller,"login"];
        $this->_routes["/auth/user_reset"] = [SmartConst::REQUEST_POST,$controller,"userReset"];
        $this->_routes["/auth/get_log"] = [SmartConst::REQUEST_POST,$controller,"getLog"];
        $this->_routes["/auth/get_settings"] = [SmartConst::REQUEST_GET,$controller,"getSiteSettings"];
                 
    }

    private function dashboard_routes(){
        $controller = "DashboardController";
        $this->_routes["/dashboard/getcount/{type}"] = [SmartConst::REQUEST_GET,$this->_admin_only,$controller,"getCounts"];
        $this->_routes["/dashboard/getcountbyyear/{year}"] = [SmartConst::REQUEST_GET,$this->_admin_only,$controller,"getCountsByYear"];
           }

    private function users_routes(){
        $controller = "UserController";       
        $this->_routes["/user/insert"] = [SmartConst::REQUEST_POST,$this->_admin_only,$controller,"insert"];
        $this->_routes["/user/update"] = [SmartConst::REQUEST_POST,$this->_admin_only,$controller,"update"];
        $this->_routes["/user/update_profile_img"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"updateUserProfilePic"];
        $this->_routes["/user/get_all"] = [SmartConst::REQUEST_GET,$this->_admin_only,$controller,"getAll"]; 
        $this->_routes["/user/get_by_org_id"] = [SmartConst::REQUEST_POST,$this->_admin_only,$controller,"getAllByOrg"]; 
        $this->_routes["/user/get_one"] = [SmartConst::REQUEST_POST,$this->_admin_only,$controller,"getOne"];
        $this->_routes["/user/get_one_user"] = [SmartConst::REQUEST_GET,$this->_admin_user,$controller,"getOneUser"];
        $this->_routes["/user/delete_one"] = [SmartConst::REQUEST_POST,$this->_admin_only,$controller,"deleteOne"];
        $this->_routes["/user/admin_reset"] = [SmartConst::REQUEST_POST,$this->_admin_only,$controller,"adminReset"];
        $this->_routes["/user/user_reset"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"userReset"];              
        $this->_routes["/user/get_all_select"] = [SmartConst::REQUEST_GET,$this->_admin_user,$controller,"getAllSelect"];
        $this->_routes["/user/get_logged_users"] = [SmartConst::REQUEST_GET,$this->_admin_only,$controller,"getRecentLoggedInUsers"];  
        $this->_routes["/user/get_one_image"] = [SmartConst::REQUEST_POST,$controller,"getOneImage"]; 
    }
    
    private function role_routes(){
        $controller = "RoleController";       
        $this->_routes["/role/insert"] = [SmartConst::REQUEST_POST,$this->_admin_only,$controller,"insert"];
        $this->_routes["/role/update"] = [SmartConst::REQUEST_POST,$this->_admin_only,$controller,"update"];
        $this->_routes["/role/get_all"] = [SmartConst::REQUEST_GET,$this->_admin_only,$controller,"getAll"]; 
        $this->_routes["/role/get_one"] = [SmartConst::REQUEST_POST,$this->_admin_only,$controller,"getOne"];            
        $this->_routes["/role/delete_one"] = [SmartConst::REQUEST_POST,$this->_admin_only,$controller,"deleteOne"];
        $this->_routes["/role/get_all_select"] = [SmartConst::REQUEST_GET,$this->_admin_user,$controller,"getAllSelect"]; 
    } 

    private function document_routes(){
        $controller = "DocumentController";   
        // 5 = submitted 6=app rejected 10=app approved 15= comlaint resolved 14=pending 11=invalid        
        $this->_routes["/document/insert"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"insert"];
        $this->_routes["/document/update"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"update"];
        $this->_routes["/document/get_all/admin/wait"] = [SmartConst::REQUEST_GET,$this->_admin_only,$controller,
        "getAll",["mode"=>"admin","status"=>[10,14]]];
        $this->_routes["/document/get_all/admin/process"] = [SmartConst::REQUEST_GET,$this->_admin_only,$controller,
        "getAll",["mode"=>"admin","status"=>[11,15]]];  
        $this->_routes["/document/get_all/user"] = [SmartConst::REQUEST_GET,$this->_admin_user,$controller,"getAll",["mode"=>"user"]]; 
        $this->_routes["/document/get_all/app/wait"] = [SmartConst::REQUEST_GET,$this->_admin_user,$controller,
        "getAll",["mode"=>"app","status"=>[5]]]; 
        $this->_routes["/document/get_all/app/process"] = [SmartConst::REQUEST_GET,$this->_admin_user,$controller,
        "getAll",["mode"=>"app","status"=>[6,10,15]]];
        $this->_routes["/document/get_one"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"getOne"];            
        $this->_routes["/document/delete_one"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"deleteOne"];
        $this->_routes["/document/get_doc_type"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"getDocByType"];
        $this->_routes["/document/get_doc_category_and_type"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"getDocByCategoryAndType"];
        $this->_routes["/document/get_doc"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"getDoc"];
        // approve
        $this->_routes["/document/update_app"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"updateApp"];
    } 

    private function telephone_routes(){
        $controller = "TelephoneController";  
        // 5 = submitted 6=app rejected 10=app approved 15= comlaint resolved 14=pending 11=invalid        
        $this->_routes["/telephone/insert"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"insert"];
        $this->_routes["/telephone/update"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"update"];
        $this->_routes["/telephone/get_all/admin/wait"] = [SmartConst::REQUEST_GET,$this->_admin_user,$controller,
        "getAll",["mode"=>"admin","status"=>[10,14]]];
        $this->_routes["/telephone/get_all/admin/process"] = [SmartConst::REQUEST_GET,$this->_admin_user,$controller,
        "getAll",["mode"=>"admin","status"=>[11,15]]];  
        $this->_routes["/telephone/get_all/user"] = [SmartConst::REQUEST_GET,$this->_admin_user,$controller,"getAll",["mode"=>"user"]]; 
        $this->_routes["/telephone/get_all/app/wait"] = [SmartConst::REQUEST_GET,$this->_admin_user,$controller,
        "getAll",["mode"=>"app","status"=>[5]]]; 
        $this->_routes["/telephone/get_all/app/process"] = [SmartConst::REQUEST_GET,$this->_admin_user,$controller,
        "getAll",["mode"=>"app","status"=>[6,10,15]]];
        $this->_routes["/telephone/get_one"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"getOne"];            
        $this->_routes["/telephone/delete_one"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"deleteOne"];
        // approve
        $this->_routes["/telephone/update_app"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"updateApp"];
 
    }

    private function electrical_routes(){
        $controller = "ElectricalController";    
        // 5 = submitted 6=app rejected 10=app approved 15= comlaint resolved 14=pending 11=invalid   
        $this->_routes["/electrical/insert"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"insert"];
        $this->_routes["/electrical/update"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"update"];
        $this->_routes["/electrical/get_all/admin/wait"] = [SmartConst::REQUEST_GET,$this->_admin_user,$controller,
        "getAll",["mode"=>"admin","status"=>[10,14]]];
        $this->_routes["/electrical/get_all/admin/process"] = [SmartConst::REQUEST_GET,$this->_admin_user,$controller,
        "getAll",["mode"=>"admin","status"=>[11,15]]];  
        $this->_routes["/electrical/get_all/user"] = [SmartConst::REQUEST_GET,$this->_admin_user,$controller,"getAll",["mode"=>"user"]]; 
        $this->_routes["/electrical/get_all/app/wait"] = [SmartConst::REQUEST_GET,$this->_admin_user,$controller,
        "getAll",["mode"=>"app","status"=>[5]]]; 
        $this->_routes["/electrical/get_all/app/process"] = [SmartConst::REQUEST_GET,$this->_admin_user,$controller,
        "getAll",["mode"=>"app","status"=>[6,10,15]]]; 
        $this->_routes["/electrical/get_one"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"getOne"];            
        $this->_routes["/electrical/delete_one"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"deleteOne"];
        // approve
        $this->_routes["/electrical/update_app"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"updateApp"];

    }

    private function network_routes(){
        $controller = "NetworkController";  
        // 5 = submitted 6=app rejected 10=app approved 15= comlaint resolved 14=pending 11=invalid   
        $this->_routes["/network/insert"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"insert"];
        $this->_routes["/network/update"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"update"];
        $this->_routes["/network/get_all/admin/wait"] = [SmartConst::REQUEST_GET,$this->_admin_user,$controller,
        "getAll",["mode"=>"admin","status"=>[10,14]]];
        $this->_routes["/network/get_all/admin/process"] = [SmartConst::REQUEST_GET,$this->_admin_user,$controller,
        "getAll",["mode"=>"admin","status"=>[11,15]]];  
        $this->_routes["/network/get_all/user"] = [SmartConst::REQUEST_GET,$this->_admin_user,$controller,"getAll",["mode"=>"user"]]; 
        $this->_routes["/network/get_all/app/wait"] = [SmartConst::REQUEST_GET,$this->_admin_user,$controller,
        "getAll",["mode"=>"app","status"=>[5]]]; 
        $this->_routes["/network/get_all/app/process"] = [SmartConst::REQUEST_GET,$this->_admin_user,$controller,
        "getAll",["mode"=>"app","status"=>[6,10,15]]]; 
        $this->_routes["/network/get_one"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"getOne"];            
        $this->_routes["/network/delete_one"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"deleteOne"];
        // approve
        $this->_routes["/network/update_app"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"updateApp"];
    }

    private function mechanical_routes(){
        $controller = "MechanicalController";  
        // 5 = submitted 6=app rejected 10=app approved 15= comlaint resolved 14=pending 11=invalid   
        $this->_routes["/mechanical/insert"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"insert"];
        $this->_routes["/mechanical/update"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"update"];
        $this->_routes["/mechanical/get_all/admin/wait"] = [SmartConst::REQUEST_GET,$this->_admin_user,$controller,
        "getAll",["mode"=>"admin","status"=>[10,14]]];
        $this->_routes["/mechanical/get_all/admin/process"] = [SmartConst::REQUEST_GET,$this->_admin_user,$controller,
        "getAll",["mode"=>"admin","status"=>[11,15]]];  
        $this->_routes["/mechanical/get_all/user"] = [SmartConst::REQUEST_GET,$this->_admin_user,$controller,"getAll",["mode"=>"user"]]; 
        $this->_routes["/mechanical/get_all/app/wait"] = [SmartConst::REQUEST_GET,$this->_admin_user,$controller,
        "getAll",["mode"=>"app","status"=>[5]]]; 
        $this->_routes["/mechanical/get_all/app/process"] = [SmartConst::REQUEST_GET,$this->_admin_user,$controller,
        "getAll",["mode"=>"app","status"=>[6,10,15]]]; 
        $this->_routes["/mechanical/get_one"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"getOne"];            
        $this->_routes["/mechanical/delete_one"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"deleteOne"];
        // approve
        $this->_routes["/mechanical/update_app"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"updateApp"];
    }
    private function meetroom_routes(){
        $controller = "MeetRoomController";       
        $this->_routes["/meetroom/insert"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"insert"];
        $this->_routes["/meetroom/update"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"update"];
        $this->_routes["/meetroom/get_all"] = [SmartConst::REQUEST_GET,$this->_admin_user,$controller,"getAll",["mode"=>"admin"]]; 
        $this->_routes["/meetroom/get_all/user"] = [SmartConst::REQUEST_GET,$this->_admin_user,$controller,"getAll",["mode"=>"user"]]; 
        $this->_routes["/meetroom/get_one"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"getOne"];            
        $this->_routes["/meetroom/delete_one"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"deleteOne"];            
        $this->_routes["/meetroom/get_all_calender"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"getAllMeetWithYearMonthRoom"];            
        // MOM TABLE APIS
        $this->_routes["/meetroom/insert_mom"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"insertMom"];
        $this->_routes["/meetroom/update_mom"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"updateMom"];
        $this->_routes["/meetroom/get_all_mom"] = [SmartConst::REQUEST_GET,$this->_admin_only,$controller,"getAllMom"]; 
        $this->_routes["/meetroom/get_one_mom"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"getOneMom"];            
        $this->_routes["/meetroom/delete_one_mom"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"deleteOneMom"];            
        $this->_routes["/meetroom/get_by_mom_type"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"getAllByMomType"];
        $this->_routes["/meetroom/get_one_pdf"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"getMomPdf"];
          // MOM TYPES TABLE APIS
        $this->_routes["/meetroom/insert_mom_types"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"insertMomTypes"];
        $this->_routes["/meetroom/update_mom_types"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"updateMomTypes"];
        $this->_routes["/meetroom/get_all_mom_types"] = [SmartConst::REQUEST_GET,$this->_admin_only,$controller,"getAllMomTypes"]; 
        $this->_routes["/meetroom/get_all_select_mom_types"] = [SmartConst::REQUEST_GET,$controller,"getAllMomTypesDropDown"]; 
        $this->_routes["/meetroom/get_one_mom_types"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"getOneMomTypes"];            
        $this->_routes["/meetroom/delete_one_mom_types"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"deleteOneMomTypes"];             
        $this->_routes["/meetroom/get_mom_type"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"getMomType"];
        $this->_routes["/meetroom/get_mom_type_pdf"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"getMomTypePdf"];  
        //getMomTypePdf           


    }

    private function type_routes(){
        $controller = "TypeController";       
        $this->_routes["/type/insert"] = [SmartConst::REQUEST_POST,$this->_admin_only,$controller,"insert"];
        $this->_routes["/type/update"] = [SmartConst::REQUEST_POST,$this->_admin_only,$controller,"update"];
        $this->_routes["/type/get_all/{type}"] = [SmartConst::REQUEST_GET,$this->_admin_user,$controller,"getAll"]; 
        $this->_routes["/type/get_one"] = [SmartConst::REQUEST_POST,$this->_admin_only,$controller,"getOne"];
        $this->_routes["/type/delete_one"] = [SmartConst::REQUEST_POST,$this->_admin_only,$controller,"deleteOne"];  
        $this->_routes["/type/get_all_select/{type}"] = [SmartConst::REQUEST_GET,$this->_admin_user,$controller,"getAllSelect"]; 
        $this->_routes["/type/get_all_select_types"] = [SmartConst::REQUEST_GET,$this->_admin_user,$controller,"getAllSelectTypes"];         

    }

    private function user_role_routes(){
        $controller = "UserRoleController";       
        $this->_routes["/userrole/insert"] = [SmartConst::REQUEST_POST,$this->_admin_only,$controller,"insert"];
        $this->_routes["/userrole/update"] = [SmartConst::REQUEST_POST,$this->_admin_only,$controller,"update"];
        $this->_routes["/userrole/get_all"] = [SmartConst::REQUEST_GET,$this->_admin_only,$controller,"getAll"]; 
        $this->_routes["/userrole/get_one"] = [SmartConst::REQUEST_POST,$this->_admin_only,$controller,"getOne"];
        $this->_routes["/userrole/delete_one"] = [SmartConst::REQUEST_POST,$this->_admin_only,$controller,"deleteOne"];            

    }

    private function user_otp_routes(){
        $controller = "UserOtpController";       
        $this->_routes["/userotp/insert"] = [SmartConst::REQUEST_POST,$this->_admin_only,$controller,"insert"];
        $this->_routes["/userotp/update"] = [SmartConst::REQUEST_POST,$this->_admin_only,$controller,"update"];
        $this->_routes["/userotp/get_all"] = [SmartConst::REQUEST_GET,$this->_admin_only,$controller,"getAll"]; 
        $this->_routes["/userotp/get_one"] = [SmartConst::REQUEST_POST,$this->_admin_only,$controller,"getOne"];
        $this->_routes["/userotp/delete_one"] = [SmartConst::REQUEST_POST,$this->_admin_only,$controller,"deleteOne"];            

    }

    private function site_routes(){
        $controller = "SiteController";       
        $this->_routes["/site/insert"] = [SmartConst::REQUEST_POST,$this->_admin_only,$controller,"insert"];
        $this->_routes["/site/insert_org"] = [SmartConst::REQUEST_POST,$this->_admin_only,$controller,"insertOrg"];
        $this->_routes["/site/get_all"] = [SmartConst::REQUEST_GET,$this->_admin_only,$controller,"getAll"]; 
        $this->_routes["/site/get_one"] = [SmartConst::REQUEST_POST,$this->_admin_only,$controller,"getOne"];            
        $this->_routes["/site/delete_one"] = [SmartConst::REQUEST_POST,$this->_admin_only,$controller,"deleteOne"];
        $this->_routes["/site/get_all_select"] = [SmartConst::REQUEST_GET,$this->_admin_only,$controller,"getAllSelect"]; 
        $this->_routes["/site/get_org_one_pdf"] = [SmartConst::REQUEST_POST,$this->_admin_only,$controller,"getOrgOnePdf"];
        $this->_routes["/site/get_org_two_pdf"] = [SmartConst::REQUEST_POST,$this->_admin_only,$controller,"getOrgTwoPdf"];
        // getOrgOnePdf
    } 


    private function form_routes(){
        $controller = "FormController";       
        $this->_routes["/form/insert"] = [SmartConst::REQUEST_POST,$this->_admin_only,$controller,"insert"];
        $this->_routes["/form/update"] = [SmartConst::REQUEST_POST,$this->_admin_only,$controller,"update"];
        $this->_routes["/form/get_all"] = [SmartConst::REQUEST_GET,$this->_admin_only,$controller,"getAll"]; 
        $this->_routes["/form/get_one"] = [SmartConst::REQUEST_POST,$this->_admin_only,$controller,"getOne"];
        $this->_routes["/form/delete_one"] = [SmartConst::REQUEST_POST,$this->_admin_only,$controller,"deleteOne"];            
        $this->_routes["/form/get_pdf"] = [SmartConst::REQUEST_POST,$controller,"get_pdf"];
    }


    private function activity_routes(){
        $controller = "ActivityController";       
        $this->_routes["/activity/insert"] = [SmartConst::REQUEST_POST,$this->_admin_only,$controller,"insert"];
        $this->_routes["/activity/update"] = [SmartConst::REQUEST_POST,$this->_admin_only,$controller,"update"];
        $this->_routes["/activity/get_all"] = [SmartConst::REQUEST_GET,$controller,"getAll"]; 
        $this->_routes["/activity/get_one"] = [SmartConst::REQUEST_POST,$this->_admin_only,$controller,"getOne"];
        $this->_routes["/activity/delete_one"] = [SmartConst::REQUEST_POST,$this->_admin_only,$controller,"deleteOne"];            
    }
    /**
     * 
     */
    private function org_routes(){
        $controller = "OrganisationController";       
        $this->_routes["/org/insert"] = [SmartConst::REQUEST_POST,$this->_admin_only,$controller,"insert"];
        $this->_routes["/org/update"] = [SmartConst::REQUEST_POST,$this->_admin_only,$controller,"update"];
        $this->_routes["/org/get_all"] = [SmartConst::REQUEST_GET,$this->_admin_user,$controller,"getAll"]; 
        $this->_routes["/org/get_all_tree"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"getAllTree"]; 
        $this->_routes["/org/get_one"] = [SmartConst::REQUEST_POST,$this->_admin_only,$controller,"getOne"];
        $this->_routes["/org/delete_one"] = [SmartConst::REQUEST_POST,$this->_admin_only,$controller,"deleteOne"];            
        $this->_routes["/org/get_all_parent"] = [SmartConst::REQUEST_GET,$this->_admin_only,$controller,"getAllParent"]; 
        $this->_routes["/org/get_all_tree_recursive"] = [SmartConst::REQUEST_GET,$this->_admin_only,$controller,"getTreeRecursive"]; 
        $this->_routes["/org/get_approving_authority"] = [SmartConst::REQUEST_GET,$this->_admin_user,$controller,"getAllAssociateParents"]; 

    }
    /**
     * 
     */
    private function doc_type_routes(){
        $controller = "DocTypeController";       
        $this->_routes["/docType/insert"] = [SmartConst::REQUEST_POST,$this->_admin_only,$controller,"insert"];
        $this->_routes["/docType/update"] = [SmartConst::REQUEST_POST,$this->_admin_only,$controller,"update"];
        $this->_routes["/docType/get_all"] = [SmartConst::REQUEST_GET,$this->_admin_user,$controller,"getAll"]; 
        $this->_routes["/docType/get_one"] = [SmartConst::REQUEST_POST,$this->_admin_only,$controller,"getOne"];
        $this->_routes["/docType/delete_one"] = [SmartConst::REQUEST_POST,$this->_admin_only,$controller,"deleteOne"];            
        $this->_routes["/docType/get_all_select"] = [SmartConst::REQUEST_POST,$this->_admin_only,$controller,"getAllDocType"];            

    }  
    /**
     * 
     */
    private function comman_complaint_routes(){
        $controller = "CommanComplaintController";    
        // 5 = submitted 6=app rejected 10=app approved 15= comlaint resolved 14=pending 11=invalid   
        $this->_routes["/complaint/insert"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"insert"];
        $this->_routes["/complaint/update"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"update"];
      
        $this->_routes["/complaint/get_all/admin/wait"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,
        "getAll",["mode"=>"admin","status"=>[10,14]]];
       
        $this->_routes["/complaint/get_all/admin/process"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,
        "getAll",["mode"=>"admin","status"=>[11,15]]];  
        
        $this->_routes["/complaint/get_all/user"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"getAll",["mode"=>"user"]]; 
        /*
        $this->_routes["/complaint/get_all/app/wait"] = [SmartConst::REQUEST_GET,$this->_admin_user,$controller,
        "getAll",["mode"=>"app","status"=>[5]]]; 
        $this->_routes["/complaint/get_all/app/process"] = [SmartConst::REQUEST_GET,$this->_admin_user,$controller,
        "getAll",["mode"=>"app","status"=>[6,10,15]]]; 
       */
        $this->_routes["/complaint/get_one"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"getOne"];            
        $this->_routes["/complaint/delete_one"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"deleteOne"];
        // approve
        $this->_routes["/complaint/update_app"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"updateApp"];
         // COMPLAINT TYPES TABLE APIS
         $this->_routes["/complaintTypes/insert_comp_types"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"insertComplaintTypes"];
         $this->_routes["/complaintTypes/update_comp_types"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"updateComplaintTypes"];
         $this->_routes["/complaintTypes/get_all_comp_types"] = [SmartConst::REQUEST_GET,$this->_admin_only,$controller,"getAllComplaintTypes"]; 
         $this->_routes["/complaintTypes/get_all_select_comp_types"] = [SmartConst::REQUEST_GET,$controller,"getAllComplaintTypesDropDown"]; 
         $this->_routes["/complaintTypes/get_one_comp_types"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"getOneComplaintTypes"];            
         $this->_routes["/complaintTypes/delete_one_comp_types"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"deleteOneComplaintTypes"];             
         $this->_routes["/complaintTypes/get_comp_type"] = [SmartConst::REQUEST_POST,$this->_admin_user,$controller,"getComplaintType"];
    }
  
    private function get_all_Routes(){
        $this->auth_routes();
        $this->dashboard_routes();
        $this->users_routes();
        $this->role_routes();
        $this->document_routes();
        $this->telephone_routes();
        $this->electrical_routes();
        $this->network_routes();
        $this->mechanical_routes();
        $this->meetroom_routes();
        $this->type_routes();
        $this->user_role_routes();
        $this->user_otp_routes();
        $this->site_routes();
        $this->form_routes();
        $this->activity_routes();
        $this->org_routes();
        $this->doc_type_routes();
        $this->comman_complaint_routes();
        
        return $this->_routes;
    }


    /**
     * 
     */
    static public function getRoutes(){
            $obj = new self();
            return $obj->get_all_routes();
    } 

}

