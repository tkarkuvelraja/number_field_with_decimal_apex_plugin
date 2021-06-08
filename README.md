# Oracle APEX Plug-In: Number Field with Decimal

**It's a Number Field with Decimal Plugin In, which allow only Numeric Values and Only one DOT in Number Field.**

Demo Application: https://apex.oracle.com/pls/apex/f?p=113036:9999::BRANCH_TO_PAGE_ACCEPT::9999:P9999_APP_PAGE_REDIRECT:35

# Prerequisite:

**DB versions:**	11.2.0.1,12.1.0.1,12.2.0.1,18.4.0.0,19.0.0.0.0,19.2.0.0.19,21.0.0.0.0,21.1.0.0.0,21.1.0.0.1

**APEX versions**	5.1.3,18.1.0.00.45,18.2.0.00.12,19.1.0.00.15,19.2.0.00.18,20.1.0.00.13,20.2.0.00.20,21.1.0

# Installation:

Export plugin file **"item_type_plugin_orclking_number_field.sql"** from Source directory and import it into your application.

# Steps to Achieve:

**Step 1:** Create a new blank page.

**Step 2:** Export plugin file **"item_type_plugin_orclking_number_field.sql"** from Source directory and import it into your application.

**Navigation:** Shared Components ==> Plug-ins ==> Import

![image](https://user-images.githubusercontent.com/85283603/121245062-a56b3d00-c8b0-11eb-9d08-c7274b46e5e7.png)

Plugin will be listed under plug-ins bucket after successful installation.

![image](https://user-images.githubusercontent.com/85283603/121245137-ba47d080-c8b0-11eb-9d65-d194142e0a3a.png)

**Step 3:** Create a region to the page. Region type should be Static Content.

![image](https://user-images.githubusercontent.com/85283603/121245222-d51a4500-c8b0-11eb-8283-57caa142e2a2.png)

**Step 4:** Create a item to the region. Change item type to "Number Field with Decimal [Plug-In]".

![image](https://user-images.githubusercontent.com/85283603/121245334-f8dd8b00-c8b0-11eb-9d10-5d7d683b073e.png)

**Step 5:** In the Settings section you can choose some options. The image below shows all the available options.

![image](https://user-images.githubusercontent.com/85283603/121245466-1dd1fe00-c8b1-11eb-8251-03312ca5f699.png)

# Output: 

Then you output would display like this,

![image](https://user-images.githubusercontent.com/85283603/121245551-35a98200-c8b1-11eb-851a-f4da1780fe99.png)

That's it.

Happy APEXing!!!...

**References:**

https://docs.oracle.com/en/database/oracle/application-express/20.2/aeapi/GET_INPUT_NAME_FOR_PAGE_ITEM-Function.html#GUID-6E53D97A-0710-4203-9F20-8F4B2153A2E1
