connection: "gurufit-cloudsql"

# include all the views
include: "/views/*.view"

datagroup: gurufit_cloudsql_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: gurufit_cloudsql_default_datagroup

explore: order {
  sql_always_where: ${es_member.mem_no}!=583;;

  view_name: es_order_goods
  ##sql_always_where: not ${es_order_goods.payment_dt_date} like "0000-00-00%" ;;
  join: es_order{
    relationship: many_to_one
    sql_on: ${es_order_goods.order_no}=${es_order.order_no} ;;
    fields: [es_order.first_sale_fl, es_order.settle_kind, es_order.order_type_fl]
  }

  join: es_member {
    relationship: many_to_one
    sql_on: ${es_order.mem_no}=${es_member.mem_no} ;;
  }

  join: es_order_info {
    relationship: many_to_one
    sql_on: ${es_order_goods.order_no}=${es_order_info.order_no} ;;
  }

  join: es_goods_link_category {
    relationship: many_to_many
    sql_on: ${es_order_goods.goods_no}=${es_goods_link_category.goods_no} ;;
    view_label: "Es Order Goods"
    fields: [es_goods_link_category.top_cate_group,es_goods_link_category.goods_cate_group]
  }

  join: es_goods {
    relationship: many_to_one
    sql_on: ${es_order_goods.goods_no}=${es_goods.goods_no} ;;
  }

  join:es_category_brand{
    relationship: many_to_one
    sql_on: ${es_goods.brand_cd}=${es_category_brand.cate_cd} ;;

  }
}
