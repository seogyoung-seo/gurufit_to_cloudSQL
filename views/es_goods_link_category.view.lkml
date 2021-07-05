view: es_goods_link_category {
  view_label: "제품별 카테고리"
  sql_table_name: gurufit_to_looker.es_goodsLinkCategory ;;

  dimension: cate_cd {
    label: "카테고리 코드"
    type: string
    sql: ${TABLE}.cateCd ;;
  }

  dimension: top_cate_group {
    label: "탑 카테고리"
    type: string
    sql: case
          when ${cate_cd} ='009' then 'NEW ARRIVAL'
          when ${cate_cd} ='010' then 'SALE'
          when ${cate_cd} ='011' then 'BEST SELLER'
          else '기타' end ;;
  }

  dimension: goods_cate_group {
    label: "제품군 카테고리"
    type: string
    sql: case
          when ${cate_cd} ='018' then '스니커즈'
          when ${cate_cd} ='019' then '캔버스'
          when ${cate_cd} ='020' then '캐주얼'
          when ${cate_cd} ='021' then '샌들/슬리퍼'
          when ${cate_cd} ='022' then '부츠'
          when ${cate_cd} ='023' then '슬립온'
          when ${cate_cd} ='024' then 'KIDS'
          when ${cate_cd} ='025' then '유아'
          when ${cate_cd} ='026' then '가방'
          when ${cate_cd} ='027' then '리뷰상품'
          else '기타' end ;;
  }
  dimension: goods_no {
    label: "상품 번호"
    type: number
    sql: ${TABLE}.goodsNo ;;
  }

  dimension: sno {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.sno ;;
  }


}
