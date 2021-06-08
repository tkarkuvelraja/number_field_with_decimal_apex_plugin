prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_210100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2021.04.15'
,p_release=>'21.1.0'
,p_default_workspace_id=>6092874424274203557
,p_default_application_id=>113036
,p_default_id_offset=>0
,p_default_owner=>'ORCLKING'
);
end;
/
 
prompt APPLICATION 113036 - About Oracle and Oracle APEX
--
-- Application Export:
--   Application:     113036
--   Name:            About Oracle and Oracle APEX
--   Date and Time:   19:41 Tuesday June 8, 2021
--   Exported By:     TKARKUVELRAJA@GMAIL.COM
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 11818388129313543301
--   Manifest End
--   Version:         21.1.0
--   Instance ID:     63113759365424
--

begin
  -- replace components
  wwv_flow_api.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/item_type/orclking_number_field_with_decimal
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(11818388129313543301)
,p_plugin_type=>'ITEM TYPE'
,p_name=>'ORCLKING.NUMBER.FIELD.WITH.DECIMAL'
,p_display_name=>'Number Field with Decimal'
,p_supported_ui_types=>'DESKTOP'
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
'  l_keypress_attr VARCHAR2(1000) := ''onKeyPress="isNumberKey(this);"'';',
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
'      -- add JS library',
'      apex_javascript.Add_library (p_name => ''isNumberKey'', -- Name the JS file',
'                                  p_directory => p_plugin.file_prefix, -- Location of the js file',
'                                  p_version => NULL);',
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
,p_standard_attributes=>'VISIBLE:SESSION_STATE:READONLY:QUICKPICK:SOURCE:ELEMENT:WIDTH:HEIGHT:ELEMENT_OPTION:PLACEHOLDER:ENCRYPT'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>'It''s a Number Field with Decimal Plugin In, which allow only Numeric Values and Only one DOT in Number Field'
,p_version_identifier=>'1.0'
,p_about_url=>'https://github.com/tkarkuvelraja/number_field_with_decimal_apex_plugin'
,p_files_version=>36
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(11818388346987543304)
,p_plugin_id=>wwv_flow_api.id(11818388129313543301)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Element Text Position'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_default_value=>'Right'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(11818389240797543306)
,p_plugin_attribute_id=>wwv_flow_api.id(11818388346987543304)
,p_display_sequence=>10
,p_display_value=>'Left'
,p_return_value=>'Left'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(11818388782287543305)
,p_plugin_attribute_id=>wwv_flow_api.id(11818388346987543304)
,p_display_sequence=>20
,p_display_value=>'Right'
,p_return_value=>'Right'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(11818389729406543306)
,p_plugin_id=>wwv_flow_api.id(11818388129313543301)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Min. Value'
,p_attribute_type=>'NUMBER'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(11818390113308543306)
,p_plugin_id=>wwv_flow_api.id(11818388129313543301)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Max. Value'
,p_attribute_type=>'NUMBER'
,p_is_required=>false
,p_is_translatable=>false
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
wwv_flow_api.g_varchar2_table(6) := '20426C6F673A20687474703A2F2F6F72636C6B696E672E626C6F6773706F742E636F6D2F0D0A202A2F0D0A200D0A66756E6374696F6E2069734E756D6265724B657928656C656D656E7429207B0D0A20202020766172206B657950726573736564203D20';
wwv_flow_api.g_varchar2_table(7) := '286576656E742E776869636829203F206576656E742E7768696368203A202877696E646F772E6576656E742E6B6579436F646529203F2077696E646F772E6576656E742E6B6579436F6465203A202D313B0D0A09636F6E736F6C652E6C6F6720286B6579';
wwv_flow_api.g_varchar2_table(8) := '50726573736564293B200D0A2020202069662028286B657950726573736564203E3D2034382920262620286B657950726573736564203C3D2035372929207B0D0A202020202020202072657475726E20747275653B0D0A202020207D0D0A0D0A20202020';
wwv_flow_api.g_varchar2_table(9) := '2F2F20272E2720636865636B696E6720646563696D616C20706F696E742E2E2E0D0A20202020656C736520696620286B657950726573736564203D3D20343629207B0D0A20202020202020202F2F20416C6C6F77206F6E6C79203120646563696D616C20';
wwv_flow_api.g_varchar2_table(10) := '706F696E742028272E27292E2E2E20200D0A20202020202020206966202828656C656D656E742E76616C7565292026262028656C656D656E742E76616C75652E696E6465784F6628272E2729203E3D203029290D0A202020202020202020202020726574';
wwv_flow_api.g_varchar2_table(11) := '75726E2066616C73653B0D0A2020202020202020656C73650D0A20202020202020202020202072657475726E20747275653B0D0A202020207D0D0A2020202072657475726E2066616C73653B0D0A7D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(11818391164180543312)
,p_plugin_id=>wwv_flow_api.id(11818388129313543301)
,p_file_name=>'isNumberKey.js'
,p_mime_type=>'text/javascript'
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
