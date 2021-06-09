prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_200100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2020.03.31'
,p_release=>'20.1.0.00.13'
,p_default_workspace_id=>42678949574119189
,p_default_application_id=>1009
,p_default_id_offset=>500534566193270241
,p_default_owner=>'FXO'
);
end;
/
 
prompt APPLICATION 1009 - DAMAC Leasing
--
-- Application Export:
--   Application:     1009
--   Name:            DAMAC Leasing
--   Date and Time:   15:40 Wednesday June 9, 2021
--   Exported By:     KARKUVELRAJA.T
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 250064415833153240
--   Manifest End
--   Version:         20.1.0.00.13
--   Instance ID:     218250327993139
--

begin
  -- replace components
  wwv_flow_api.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/item_type/orclking_number_field_with_decimal
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(250064415833153240)
,p_plugin_type=>'ITEM TYPE'
,p_name=>'ORCLKING.NUMBER.FIELD.WITH.DECIMAL'
,p_display_name=>'Number Field with Decimal'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_supported_component_types=>'APEX_APPLICATION_PAGE_ITEMS'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'FUNCTION Render_item (p_item                IN apex_plugin.t_page_item, -- Item Name',
'                      p_plugin              IN apex_plugin.t_plugin, -- Plugin name',
'                      p_value               IN NUMBER,-- Value of the item',
'                      p_is_readonly         IN BOOLEAN,-- Readonly parameter',
'                      p_is_printer_friendly IN BOOLEAN -- Printer friendly parameter',
'                     )',
'RETURN apex_plugin.t_page_item_render_result',
'IS',
'  -- Element value position (Left/Right)',
'  l_name          VARCHAR2(30);',
'  l_data_type     VARCHAR2(10) := ''number''; -- Number field',
'  l_data_align    apex_application_page_items.attribute_01%TYPE:= Nvl(p_item.attribute_01, ''right'');',
'  p_min           apex_application_page_items.attribute_02%TYPE:= p_item.attribute_02;',
'  p_max           apex_application_page_items.attribute_03%TYPE:= p_item.attribute_03;',
'  p_digits        apex_application_page_items.attribute_04%TYPE:= p_item.attribute_04;',
'  l_keypress_attr VARCHAR2(1000) := ''onkeypress="return isNumberKey(this.id,''||nvl(p_digits,2)||'')'';',
'  l_result        apex_plugin.t_page_item_render_result;',
'BEGIN',
'    IF (p_is_readonly OR p_is_printer_friendly) THEN',
'      apex_plugin_util.Print_hidden_if_readonly (p_item_name => p_item.name,',
'                                                 p_value => p_value, ',
'                                                 p_is_readonly => p_is_readonly,',
'                                                 p_is_printer_friendly => p_is_printer_friendly',
'                                                 );',
'',
'      apex_plugin_util.Print_display_only (p_item_name => p_item.name,',
'                                           p_display_value => p_value, ',
'                                           p_show_line_breaks => FALSE, ',
'                                           p_escape => TRUE,',
'                                           p_attributes => p_item.element_attributes);',
'    ELSE',
'      -- add JS file',
'      apex_javascript.Add_library (p_name => ''isNumberKey'', -- Name the JS file',
'                                  p_directory => p_plugin.file_prefix, -- Location of the js file',
'                                  p_version => NULL);',
'      ',
'      -- add CSS file',
'      apex_css.add_file(p_name  => ''hideupanddownarrow'',  -- Name the CSS file',
'                       p_directory => p_plugin.file_prefix, -- Location of the CSS file',
'                       p_version => NULL);',
'',
'      l_name := apex_plugin.Get_input_name_for_page_item(p_is_multi_value => FALSE);',
'      ',
'      -- Create number field',
'      htp.P(''<input type="''',
'            ||l_data_type',
'            ||''" autocomplete="off" style="text-align:''',
'            ||l_data_align',
'            ||''" name="''',
'            ||l_name',
'            || ''" id="''',
'            ||p_item.name',
'            || ''" placeholder="''',
'            ||p_item.placeholder',
'            ||''" ''',
'            || ''value="''',
'            ||htf.Escape_sc(p_value)',
'            || ''" size="''',
'            ||p_item.element_width',
'            ||''" ''',
'            || ''maxlength="''',
'            ||p_item.element_max_length',
'            ||''" ''',
'            || ''min="''',
'            ||p_min',
'            ||''" ''',
'            || ''max="''',
'            ||p_max',
'            ||''" ''',
'            || ''class="''',
'            ||p_item.element_css_classes',
'            ||'' apex-item-text text_field" ''',
'            || ''style="direction:ltr" ''',
'            || p_item.element_attributes',
'            ||'' ''',
'            ||l_keypress_attr',
'            ||''")'''' />'');',
'    END IF;',
'    RETURN l_result;',
'END render_item;'))
,p_api_version=>1
,p_render_function=>'render_item'
,p_standard_attributes=>'VISIBLE:SESSION_STATE:READONLY:SOURCE:ELEMENT:WIDTH:PLACEHOLDER:ENCRYPT'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>'It''s a Number Field with Decimal Plugin In, which allow only Numeric Values and Only one DOT in Number Field'
,p_version_identifier=>'1.0'
,p_about_url=>'https://github.com/tkarkuvelraja/number_field_with_decimal_apex_plugin'
,p_files_version=>32
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(208046870162772051)
,p_plugin_id=>wwv_flow_api.id(250064415833153240)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Element Text Position'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_default_value=>'Right'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(208047645090770992)
,p_plugin_attribute_id=>wwv_flow_api.id(208046870162772051)
,p_display_sequence=>10
,p_display_value=>'Left'
,p_return_value=>'Left'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(208048019275770214)
,p_plugin_attribute_id=>wwv_flow_api.id(208046870162772051)
,p_display_sequence=>20
,p_display_value=>'Right'
,p_return_value=>'Right'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(208052507109758358)
,p_plugin_id=>wwv_flow_api.id(250064415833153240)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Min. Value'
,p_attribute_type=>'NUMBER'
,p_is_required=>false
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(208053216635756803)
,p_plugin_id=>wwv_flow_api.id(250064415833153240)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Max. Value'
,p_attribute_type=>'NUMBER'
,p_is_required=>false
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(208048835266766413)
,p_plugin_id=>wwv_flow_api.id(250064415833153240)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Digits'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_default_value=>'2'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(208049662092765783)
,p_plugin_attribute_id=>wwv_flow_api.id(208048835266766413)
,p_display_sequence=>10
,p_display_value=>'2'
,p_return_value=>'2'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(208050053829765285)
,p_plugin_attribute_id=>wwv_flow_api.id(208048835266766413)
,p_display_sequence=>20
,p_display_value=>'4'
,p_return_value=>'4'
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A0D0A202A204E756D626572204669656C642E0D0A202A20506C75672D696E20547970653A204974656E6D0D0A202A2053756D6D6172793A20506C7567696E20496E20746F20616C6C6F77206F6E6C79204E756D657269632056616C75657320616E64';
wwv_flow_api.g_varchar2_table(2) := '20616C6C6F77204F6E6C79206F6E6520444F5420696E2061204E756D626572204669656C642E0D0A202A0D0A202A202D2D2D2D2D20436F6E7461637420696E666F726D6174696F6E202D2D2D2D0D0A202A0D0A202A20446576656C6F706564206279202A';
wwv_flow_api.g_varchar2_table(3) := '204576616C7561746520436F6E73756C74696E672053657276696365732C2042616E67616C6F72650D0A202A20436F6E746163743A20696E666F406576616C7561746563732E636F6D0D0A202A20576562736974653A2068747470733A2F2F6576616C75';
wwv_flow_api.g_varchar2_table(4) := '61746563732E636F6D0D0A202A0D0A202A2040617574686F72204B61726B7576656C72616A61205468616E67616D617269617070616E202D20746B61726B7576656C72616A6140676D61696C2E636F6D0D0A202A2050726F66696C653A2068747470733A';
wwv_flow_api.g_varchar2_table(5) := '2F2F7777772E6C696E6B6564696E2E636F6D2F696E2F6B61726B7576656C72616A617468616E67616D617269617070616E0D0A202A20547769747465723A2068747470733A2F2F747769747465722E636F6D2F746B61726B7576656C72616A610D0A202A';
wwv_flow_api.g_varchar2_table(6) := '20426C6F673A20687474703A2F2F6F72636C6B696E672E626C6F6773706F742E636F6D2F0D0A202A2F0D0A200D0A696E7075745B747970653D226E756D626572225D207B0D0A20202D6D6F7A2D617070656172616E63653A20746578746669656C643B0D';
wwv_flow_api.g_varchar2_table(7) := '0A7D0D0A696E7075745B747970653D226E756D626572225D3A3A2D7765626B69742D696E6E65722D7370696E2D627574746F6E2C200D0A696E7075745B747970653D226E756D626572225D3A3A2D7765626B69742D6F757465722D7370696E2D62757474';
wwv_flow_api.g_varchar2_table(8) := '6F6E207B200D0A20202D7765626B69742D617070656172616E63653A206E6F6E653B200D0A20206D617267696E3A20303B200D0A7D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(208023804496885496)
,p_plugin_id=>wwv_flow_api.id(250064415833153240)
,p_file_name=>'hideupanddownarrow.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A0D0A202A204E756D626572204669656C642E0D0A202A20506C75672D696E20547970653A204974656E6D0D0A202A2053756D6D6172793A20506C7567696E20496E20746F20616C6C6F77206F6E6C79204E756D657269632056616C75657320616E64';
wwv_flow_api.g_varchar2_table(2) := '20616C6C6F77204F6E6C79206F6E6520444F5420696E2061204E756D626572204669656C642E0D0A202A0D0A202A202D2D2D2D2D20436F6E7461637420696E666F726D6174696F6E202D2D2D2D0D0A202A0D0A202A20446576656C6F706564206279202A';
wwv_flow_api.g_varchar2_table(3) := '204576616C7561746520436F6E73756C74696E672053657276696365732C2042616E67616C6F72650D0A202A20436F6E746163743A20696E666F406576616C7561746563732E636F6D0D0A202A20576562736974653A2068747470733A2F2F6576616C75';
wwv_flow_api.g_varchar2_table(4) := '61746563732E636F6D0D0A202A0D0A202A2040617574686F72204B61726B7576656C72616A61205468616E67616D617269617070616E202D20746B61726B7576656C72616A6140676D61696C2E636F6D0D0A202A2050726F66696C653A2068747470733A';
wwv_flow_api.g_varchar2_table(5) := '2F2F7777772E6C696E6B6564696E2E636F6D2F696E2F6B61726B7576656C72616A617468616E67616D617269617070616E0D0A202A20547769747465723A2068747470733A2F2F747769747465722E636F6D2F746B61726B7576656C72616A610D0A202A';
wwv_flow_api.g_varchar2_table(6) := '20426C6F673A20687474703A2F2F6F72636C6B696E672E626C6F6773706F742E636F6D2F0D0A202A205265666572656E63653A2068747470733A2F2F737461636B6F766572666C6F772E636F6D2F7175657374696F6E732F393739393530352F616C6C6F';
wwv_flow_api.g_varchar2_table(7) := '772D6F6E6C792D6E756D626572732D616E642D646F742D696E2D7363726970740D0A202A2F0D0A200D0A66756E6374696F6E2069734E756D6265724B65792869642C646563696D616C706F696E747329207B0D0A20202020696620286576656E742E6B65';
wwv_flow_api.g_varchar2_table(8) := '79436F6465203E203437202626206576656E742E6B6579436F6465203C203538207C7C206576656E742E6B6579436F6465203D3D20343629207B0D0A20202020202020202F2F20207661722074787462783D646F63756D656E742E676574456C656D656E';
wwv_flow_api.g_varchar2_table(9) := '744279496428747874293B0D0A202020202020202076617220616D6F756E74203D20646F63756D656E742E676574456C656D656E7442794964286964292E76616C75653B0D0A202020202020202076617220646F7470726573656E74203D20303B0D0A20';
wwv_flow_api.g_varchar2_table(10) := '2020202020202076617220636F756E74203D20303B0D0A636F6E736F6C652E6C6F672028646F7470726573656E74293B0D0A636F6E736F6C652E6C6F672028636F756E74293B0D0A2F2F636F6E736F6C652E6C6F672028616D6F756E742E696E6465784F';
wwv_flow_api.g_varchar2_table(11) := '6628222E222C20646F7470726573656E7429293B0D0A20202020202020206966202820616D6F756E742E696E6465784F6628222E222C20646F7470726573656E74202B203129293B207B0D0A2020202020202020202020202F2F20616C65727428273027';
wwv_flow_api.g_varchar2_table(12) := '293B0D0A20202020202020207D0D0A0D0A2020202020202020646F207B0D0A202020202020202020202020646F7470726573656E74203D20616D6F756E742E696E6465784F6628222E222C20646F7470726573656E74293B0D0A20202020202020202020';
wwv_flow_api.g_varchar2_table(13) := '202069662028646F7470726573656E7420213D202D3129207B0D0A20202020202020202020202020202020636F756E742B2B3B0D0A20202020202020202020202020202020646F7470726573656E742B2B3B0D0A2020202020202020202020207D0D0A20';
wwv_flow_api.g_varchar2_table(14) := '202020202020207D0D0A20202020202020207768696C652028646F7470726573656E7420213D202D31293B0D0A202020202020202069662028646F7470726573656E74203D3D202D3120262620616D6F756E742E6C656E677468203D3D20302026262065';
wwv_flow_api.g_varchar2_table(15) := '76656E742E6B6579436F6465203D3D20343629207B0D0A2020202020202020202020206576656E742E6B6579436F6465203D20303B0D0A202020202020202020202020616C657274282257726F6E6720706F736974696F6E206F6620646563696D616C20';
wwv_flow_api.g_varchar2_table(16) := '706F696E74206E6F742020616C6C6F77656420212122293B0D0A20202020202020202020202072657475726E2066616C73653B0D0A20202020202020207D0D0A0D0A202020202020202069662028636F756E74203E3D2031202626206576656E742E6B65';
wwv_flow_api.g_varchar2_table(17) := '79436F6465203D3D20343629207B0D0A0D0A2020202020202020202020206576656E742E6B6579436F6465203D20303B0D0A202020202020202020202020616C65727428224F6E6C79206F6E6520646563696D616C20706F696E7420697320616C6C6F77';
wwv_flow_api.g_varchar2_table(18) := '656420212122293B0D0A20202020202020202020202072657475726E2066616C73653B0D0A20202020202020207D0D0A09090D0A09092069662028616D6F756E742E6C656E677468203E203020262620636F756E74203E3D2031202626206576656E742E';
wwv_flow_api.g_varchar2_table(19) := '6B6579436F6465203D3D20343629207B0D0A0D0A2020202020202020202020206576656E742E6B6579436F6465203D20303B0D0A202020202020202020202020616C65727428224F6E6C79206F6E6520646563696D616C20706F696E7420697320616C6C';
wwv_flow_api.g_varchar2_table(20) := '6F77656420212122293B0D0A20202020202020202020202072657475726E2066616C73653B0D0A20202020202020207D0D0A09090D0A202020202020202069662028636F756E74203D3D203129207B0D0A202020202020202020202020766172206C6173';
wwv_flow_api.g_varchar2_table(21) := '74646967697473203D20616D6F756E742E737562737472696E6728616D6F756E742E696E6465784F6628222E2229202B20312C20616D6F756E742E6C656E677468293B0D0A202020202020202020202020696620286C6173746469676974732E6C656E67';
wwv_flow_api.g_varchar2_table(22) := '7468203E3D20646563696D616C706F696E747329207B0D0A090909096C657420737472203D20646563696D616C706F696E74733B0D0A09090909737472202B3D202720273B0D0A09090909737472202B3D2027646563696D616C20706C61636573206F6E';
wwv_flow_api.g_varchar2_table(23) := '6C7920616C6C6F776564273B0D0A090909097374723B0D0A20202020202020202020202020202020616C65727428737472293B0D0A202020202020202020202020202020206576656E742E6B6579436F6465203D20303B0D0A2020202020202020202020';
wwv_flow_api.g_varchar2_table(24) := '202020202072657475726E2066616C73653B0D0A2020202020202020202020207D0D0A20202020202020207D0D0A202020202020202072657475726E20747275653B0D0A202020207D20656C7365207B0D0A20202020202020206576656E742E6B657943';
wwv_flow_api.g_varchar2_table(25) := '6F6465203D20303B0D0A2020202020202020616C65727428224F6E6C79204E756D62657273207769746820646F7420616C6C6F77656420212122293B0D0A202020202020202072657475726E2066616C73653B0D0A202020207D0D0A0D0A7D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(208024159624885477)
,p_plugin_id=>wwv_flow_api.id(250064415833153240)
,p_file_name=>'isNumberKey.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
