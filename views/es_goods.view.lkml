view: es_goods {
  sql_table_name: gurufit_to_looker.es_goods ;;

  dimension: goods_no {
    label: "상품 번호"
    primary_key: yes
    type: number
    sql: ${TABLE}.goodsNo ;;
  }

  dimension: goods_nm {
    label: "상품 이름"
    type: string
    sql: ${TABLE}.goodsNm ;;
  }

  dimension: goods_brand {
    label: "브랜드"
    type: string
    sql: SUBSTRING_INDEX(${goods_nm}, ' ', 1) ;;
  }

  dimension: goods_sell_fl {
    label: "상품판매 여부(y/n)"
    type: string
    sql: ${TABLE}.goodsSellFl ;;
  }

############################################################################# 영업 이익률 관련 지표
  dimension: brandcate_cd {
    hidden: no
    label: "브랜드 카테고리 코드"
    type: string
    sql: case
          when ${es_order_goods.goods_no} in ("1000002601","1000002605","1000002640","1000002638","1000002641","1000002604","1000002642","1000002602","1000002603") then "GB"
          else ${TABLE}.brandcateCd
          end
          ;;
  }

  dimension: purchase_no {
    label: "매입처 번호"
    hidden: no
    type: number
    sql: case
          when ${es_order_goods.goods_no} in ("1000002601","1000002605","1000002640","1000002638","1000002641","1000002604","1000002642","1000002602","1000002603") then "100009"
          when ${es_order_goods.goods_no}="1000002637" then "100011"
          when ${es_order_goods.goods_no} in ("1000002639","1000002643") then "100013"
          else ${TABLE}.purchaseNo
          end
          ;;
  }

  dimension: lesmore_dc_rate {
    hidden: yes
    type: number
    sql:  case
          when ${es_order_goods.goods_no} in ("1000002601","1000002605","1000002640","1000002638","1000002641","1000002642") then 0
          when ${es_order_goods.goods_no}="1000002604" then 20
          when ${es_order_goods.goods_no} in ("1000002602","1000002603") then "30"
          else ${TABLE}.lesmoreDcRate
          end
          ;;
  }

  dimension: hit_cnt {
    hidden: no
    type: number
    sql: ${TABLE}.hitCnt ;;
  }

  dimension: cart_cnt {
    hidden: no
    type: number
    sql: ${TABLE}.cartCnt ;;
  }

  dimension: wish_cnt {
    hidden: no
    type: number
    sql: ${TABLE}.wishCnt ;;
  }

  dimension: review_cnt {
    hidden: no
    type: number
    sql: ${TABLE}.reviewCnt ;;
  }

############################################################################# measure

  measure: total_hit {
    label: "총 조회 수"
    type: sum
    sql: ${hit_cnt} ;;
  }

  measure: total_cart {
    label: "총 장바구니 수"
    type: sum
    sql: ${cart_cnt} ;;
  }

  measure: total_wish {
    label: "총 관심상품 수"
    type: sum
    sql: ${wish_cnt} ;;
  }

  measure: total_review {
    label: "총 리뷰 수"
    type: sum
    sql: ${review_cnt} ;;
  }

  measure: total_goods {
    label: "총 상품 수"
    type: count_distinct
    sql: ${goods_no} ;;
  }

############################################################################# dimension

  # dimension: brand_cd {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.brandCd ;;
  # }

  # dimension: cate_cd {
  #   hidden: yes
  #   type: string
  #   sql: ${TABLE}.cateCd ;;
  # }

  # dimension: delivery_sno {
  #   hidden: yes
  #   type: number
  #   sql: ${TABLE}.deliverySno ;;
  # }

  # dimension: fixed_price {
  #   hidden: yes
  #   type: number
  #   sql: ${TABLE}.fixedPrice ;;
  # }

}