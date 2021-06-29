view: es_category_brand {
  sql_table_name: gurufit_to_looker.es_categoryBrand ;;

  dimension: cate_cd {
    hidden: yes
    type: string
    sql: ${TABLE}.cateCd ;;
  }

  dimension: cate_nm {
    hidden: yes
    type: string
    sql: ${TABLE}.cateNm ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}
