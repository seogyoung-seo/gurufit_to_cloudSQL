connection: "gurufit-cloudsql"

# include all the views
include: "/views/**/*.view"

datagroup: gurufit_cloudsql_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: gurufit_cloudsql_default_datagroup

explore: es_order {}

# explore: es_add_exchange_order_backup {}

# explore: es_add_exchange_order_goods_backup {}

# explore: es_add_goods {}

# explore: es_add_goods_global {}

# explore: es_add_goods_group {}

# explore: es_add_goods_group_goods {}

# explore: es_admin_log {}

# explore: es_admin_menu {}

# explore: es_admin_order_goods_memo {}

# explore: es_app_device_info {}

# explore: es_app_install_benefit {}

# explore: es_app_push_statistics {}

# explore: es_app_statistics {}

# explore: es_attendance {}

# explore: es_attendance_check {}

# explore: es_attendance_reply {}

# explore: es_barcode {}

# explore: es_barcode_coupon {}

# explore: es_bd_cooperation {}

# explore: es_bd_event {}

# explore: es_bd_goodsqa {}

# explore: es_bd_goodsreview {}

# explore: es_bd_magazine {}

# explore: es_bd_notice {}

# explore: es_bd_qa {}

# explore: es_board {}

# explore: es_board_extra_data {}

# explore: es_board_hit_ip {}

# explore: es_board_memo {}

# explore: es_board_recommend {}

# explore: es_board_template {}

# explore: es_board_theme {}

# explore: es_buyer_inform {}

# explore: es_buyer_inform_global {}

# explore: es_cart {}

# explore: es_cart_remind {}

# explore: es_cart_statistics {}

# explore: es_cart_write {}

# explore: es_category_brand {}

# explore: es_category_brand_global {}

# explore: es_category_goods {}

# explore: es_category_goods_global {}

# explore: es_category_statistics {}

# explore: es_category_theme {}

# explore: es_code {}

# explore: es_code_global {}

# explore: es_comeback_coupon {}

# explore: es_comeback_coupon_member {}

# explore: es_common_content {}

# explore: es_config {}

# explore: es_config_global {}

# explore: es_countries {}

# explore: es_coupon {}

# explore: es_coupon_offline_code {}

# explore: es_coupon_use_member_group {}

# explore: es_crm_counsel {}

# explore: es_design_banner {}

# explore: es_design_banner_group {}

# explore: es_design_multi_popup {}

# explore: es_design_popup {}

# explore: es_design_slider_banner {}

# explore: es_display_event_group_theme {}

# explore: es_display_event_group_theme_tmp {}

# explore: es_display_theme {}

# explore: es_display_theme_config {}

# explore: es_display_theme_mobile {}

# explore: es_ems_rate {}

# explore: es_event {}

# explore: es_excel_form {}

# explore: es_excel_request {}

# explore: es_exchange_rate {}

# explore: es_exchange_rate_auto {}

# explore: es_exchange_rate_config {}

# explore: es_exchange_rate_log {}

# explore: es_facebook_goods_feed {}

# explore: es_faq {}

# explore: es_ghost_depositor {}

# explore: es_gift {}

# explore: es_gift_present {}

# explore: es_gift_present_info {}

# explore: es_global_currency {}

# explore: es_goods {}

# explore: es_goods_add_info {}

# explore: es_goods_benefit {}

# explore: es_goods_category_statistics {}

# explore: es_goods_global {}

# explore: es_goods_icon {}

# explore: es_goods_image {}

# explore: es_goods_link_benefit {}

# explore: es_goods_link_brand {}

# explore: es_goods_link_category {}

# explore: es_goods_main_statistics {}

# explore: es_goods_must_info {}

# explore: es_goods_option {}

# explore: es_goods_option_category_statistics {}

# explore: es_goods_option_icon {}

# explore: es_goods_option_icon_temp {}

# explore: es_goods_option_statistics {}

# explore: es_goods_option_stock_alarm {}

# explore: es_goods_option_temp {}

# explore: es_goods_option_text {}

# explore: es_goods_page_view {}

# explore: es_goods_restock {}

# explore: es_goods_sale_statistics {}

# explore: es_goods_search {}

# explore: es_goods_search_bak190106 {}

# explore: es_goods_statistics {}

# explore: es_goods_update_naver {}

# explore: es_goods_view_statistics {}

# explore: es_insgo_widget {}

# explore: es_kakao_luna_message_template {}

# explore: es_kakao_message_template {}

# explore: es_link_main_statistics {}

# explore: es_log_add_goods {}

# explore: es_log_barcode {}

# explore: es_log_goods {}

# explore: es_log_goods_mapping {}

# explore: es_log_legal_requirements {}

# explore: es_log_order {}

# explore: es_log_scm_commission {}

# explore: es_log_stock {}

# explore: es_log_whole {}

# explore: es_logistics_order {}

# explore: es_mail_log {}

# explore: es_mail_send_list {}

# explore: es_mall {}

# explore: es_manage_bank {}

# explore: es_manage_delivery_company {}

# explore: es_manage_goods_icon {}

# explore: es_manage_goods_option {}

# explore: es_manager {}

# explore: es_manager_before_passwords {}

# explore: es_manager_customer_service {}

# explore: es_manager_goods_grid_config {}

# explore: es_manager_memo {}

# explore: es_manager_order_grid_config {}

# explore: es_manager_search_config {}

# explore: es_marketing {}

# explore: es_member {}

# explore: es_member_coupon {}

# explore: es_member_deposit {}

# explore: es_member_group {}

# explore: es_member_hackout {}

# explore: es_member_history {}

# explore: es_member_invoice_info {}

# explore: es_member_login_log {}

# explore: es_member_mileage {}

# explore: es_member_modify_event {}

# explore: es_member_modify_event_result {}

# explore: es_member_notification_log {}

# explore: es_member_order_goods_count {}

# explore: es_member_order_goods_count_log {}

# explore: es_member_simple_join_log {}

# explore: es_member_simple_join_push_log {}

# explore: es_member_sleep {}

# explore: es_member_sns {}

# explore: es_member_statistics {}

# explore: es_member_statistics_age {}

# explore: es_member_statistics_area {}

# explore: es_member_statistics_day {}

# explore: es_member_statistics_deposit {}

# explore: es_member_statistics_gender {}

# explore: es_member_statistics_id {}

# explore: es_navercheckout {}

# explore: es_navercheckout_item {}

# explore: es_order_add_field {}

# explore: es_order_add_field_global {}

# explore: es_order_add_goods {}

# explore: es_order_bak191112 {}

# explore: es_order_bankda_memo {}

# explore: es_order_cash_receipt {}

# explore: es_order_cash_receipt_original {}

# explore: es_order_consult {}

# explore: es_order_coupon {}

# explore: es_order_coupon_original {}

# explore: es_order_delivery {}

# explore: es_order_delivery_original {}

# explore: es_order_download_form {}

# explore: es_order_exchange_handle {}

# explore: es_order_frequency_address {}

# explore: es_order_gift {}

# explore: es_order_gift_original {}

# explore: es_order_godo_post {}

# explore: es_order_goods {}

# explore: es_order_goods_bak180409 {}

# explore: es_order_goods_bak180618 {}

# explore: es_order_goods_bak191112 {}

# explore: es_order_goods_bak200512 {}

# explore: es_order_goods_original {}

# explore: es_order_handle {}

# explore: es_order_info {}

# explore: es_order_invoice {}

# explore: es_order_original {}

# explore: es_order_pay_history {}

# explore: es_order_pay_history2 {}

# explore: es_order_sales_statistics {}

# explore: es_order_sales_statistics_original {}

# explore: es_order_shipping_address {}

# explore: es_order_tax {}

# explore: es_order_tax_issue {}

# explore: es_order_user_handle {}

# explore: es_out_side_script {}

# explore: es_out_side_script_global {}

# explore: es_overseas_delivery_basic {}

# explore: es_overseas_delivery_countries {}

# explore: es_overseas_delivery_country_group {}

# explore: es_overseas_delivery_group {}

# explore: es_patch_manage {}

# explore: es_plus_memo {}

# explore: es_plus_memo_article {}

# explore: es_plus_review_add_form {}

# explore: es_plus_review_article {}

# explore: es_plus_review_memo {}

# explore: es_plus_review_popup_skip {}

# explore: es_plus_review_recommend {}

# explore: es_poll {}

# explore: es_poll_result {}

# explore: es_populate_theme {}

# explore: es_popup_page {}

# explore: es_purchase {}

# explore: es_qrcode {}

# explore: es_recommend_goods {}

# explore: es_schedule {}

# explore: es_scm_adjust {}

# explore: es_scm_adjust_log {}

# explore: es_scm_adjust_tax_bill {}

# explore: es_scm_board {}

# explore: es_scm_board_group {}

# explore: es_scm_commission {}

# explore: es_scm_commission_schedule {}

# explore: es_scm_delivery_area {}

# explore: es_scm_delivery_area_group {}

# explore: es_scm_delivery_basic {}

# explore: es_scm_delivery_charge {}

# explore: es_scm_manage {}

# explore: es_search_word_statistics {}

# explore: es_seo_tag {}

# explore: es_short_url {}

# explore: es_short_url_statistics {}

# explore: es_sms080 {}

# explore: es_sms_contents {}

# explore: es_sms_excel_log {}

# explore: es_sms_log {}

# explore: es_sms_send_list {}

# explore: es_ssl_config {}

# explore: es_time_sale {}

# explore: es_tmp_goods_image {}

# explore: es_unstoring_address {}

# explore: es_visit_statistics {}

# explore: es_visit_statistics_day {}

# explore: es_visit_statistics_hour {}

# explore: es_visit_statistics_month {}

# explore: es_visit_statistics_search_word {}

# explore: es_visit_statistics_user {}

# explore: es_wish {}

# explore: es_wish_statistics {}

# explore: ng_pf_deploy_test_shop {}

# explore: pa_app_data {}

# explore: zz_es_admin_menu_20200401 {}

# explore: zz_es_admin_menu_20200520 {}

# explore: zz_es_manager_20200401 {}

# explore: zz_es_manager_20200520 {}

# explore: zz_es_member_coupon_20200103 {}

# explore: zz_es_member_coupon_20200103_4 {}

