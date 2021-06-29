view: es_order_info {
  sql_table_name: gurufit_to_looker.es_orderInfo ;;

############################################################################# 주문 정보

  dimension: sno {
    group_label: "주문 정보"
    type: number
    sql: ${TABLE}.sno ;;
  }
  dimension: order_no {
    group_label: "주문 정보"
    description: "주문번호"
    type: string
    sql: ${TABLE}.orderNo ;;
  }

  dimension: order_memo {
    group_label: "주문 정보"
    description: "주문시 남기는 글"
    type: string
    sql: ${TABLE}.orderMemo ;;
  }

  dimension: packet_code {
    group_label: "주문 정보"
    description: "묶음배송코드"
    type: string
    sql: ${TABLE}.packetCode ;;
  }


############################################################################# 주문자 개인정보

  dimension: order_cell_phone {
    group_label: "주문자 개인정보"
    description: "주문자 핸드폰 번호"
    type: string
    sql: ${TABLE}.orderCellPhone ;;
  }

  dimension: order_email {
    group_label: "주문자 개인정보"
    description: "주문자 e-mail"
    type: string
    sql: ${TABLE}.orderEmail ;;
  }

  dimension: order_name {
    group_label: "주문자 개인정보"
    description: "주문자 이름"
    type: string
    sql: ${TABLE}.orderName ;;
  }
  dimension: order_phone {
    group_label: "주문자 개인정보"
    description: "주문자 전화번호"
    type: string
    sql: ${TABLE}.orderPhone ;;
  }


############################################################################# 주문자 지역
  dimension: order_address {
    group_label: "주문자 지역"
    description: "주문자 주소"
    type: string
    sql: ${TABLE}.orderAddress ;;
  }

  dimension: order_address_sub {
    group_label: "주문자 지역"
    description: "주문자 나머지 주소"
    type: string
    sql: ${TABLE}.orderAddressSub ;;
  }

  dimension: order_city {
    group_label: "주문자 지역"
    description: "주문자 도시"
    type: string
    sql: ${TABLE}.orderCity ;;
  }

  dimension: order_zipcode {
    group_label: "주문자 지역"
    description: "주문자 우편번호"

    type: string
    sql: ${TABLE}.orderZipcode ;;
  }

  dimension: order_zonecode {
    group_label: "주문자 지역"
    description: "주문자 우편번호(10자리)"
    type: string
    sql: ${TABLE}.orderZonecode ;;
  }

  dimension: order_state {
    group_label: "주문자 지역"
    description: "주문자 주/지방/지역"
    type: string
    sql: ${TABLE}.orderState ;;
  }

############################################################################# 수취인 개인정보
  dimension: receiver_use_safe_number_fl {
    group_label: "수취인 개인정보"
    description: "수취인 안심번호 사용여부(n:미사용, y:사용, w:발급대기, c:사용해지)"
    type: string
    sql: ${TABLE}.receiverUseSafeNumberFl ;;
  }

  dimension: receiver_cell_phone {
    group_label: "수취인 개인정보"
    description: "수취인 핸드폰 번호"
    type: string
    sql: ${TABLE}.receiverCellPhone ;;
  }


  dimension: receiver_name {
    group_label: "수취인 개인정보"
    description: "수취인 이름"
    type: string
    sql: ${TABLE}.receiverName ;;
  }

  dimension: receiver_phone {
    group_label: "수취인 개인정보"
    description: "수취인 전화번호"
    type: string
    sql: ${TABLE}.receiverPhone ;;
  }


  dimension: receiver_safe_number {
    group_label: "수취인 개인정보"
    description: "수취인 안심번호"
    type: string
    sql: ${TABLE}.receiverSafeNumber ;;
  }




############################################################################# 수취인 지역

  dimension: add_tier {
    group_label: "수취인 지역"
    description: "배송지 그룹"
    type: string
    sql: case
        when SUBSTRING_INDEX(${receiver_address}, ' ', 1)='경기도' then '경기도'
        when SUBSTRING_INDEX(${receiver_address}, ' ', 1)='서울특별시' then '서울특별시'
        when SUBSTRING_INDEX(${receiver_address}, ' ', 1)='부산광역시' then '부산광역시'
        when SUBSTRING_INDEX(${receiver_address}, ' ', 1)='인천광역시' then '인천광역시'
        when SUBSTRING_INDEX(${receiver_address}, ' ', 1)='대구광역시' then '대구광역시'
        when SUBSTRING_INDEX(${receiver_address}, ' ', 1)='대전광역시' then '대전광역시'
        when SUBSTRING_INDEX(${receiver_address}, ' ', 1)='광주광역시' then '광주광역시'
        when SUBSTRING_INDEX(${receiver_address}, ' ', 1)='울산광역시' then '울산광역시'
        when SUBSTRING_INDEX(${receiver_address}, ' ', 1)='경상남도' or SUBSTRING_INDEX(${receiver_address}, ' ', 1)='경상북도' then '경상도'
        when SUBSTRING_INDEX(${receiver_address}, ' ', 1)='전라남도' or SUBSTRING_INDEX(${receiver_address}, ' ', 1)='전라북도' then '전라도'
        when SUBSTRING_INDEX(${receiver_address}, ' ', 1)='충청남도' or SUBSTRING_INDEX(${receiver_address}, ' ', 1)='충청북도' then '충청도'
        when SUBSTRING_INDEX(${receiver_address}, ' ', 1)='' or SUBSTRING_INDEX(${receiver_address}, ' ', 1) is null then '알 수 없음'
        else '기타 지역' end ;;
    drill_fields: [add1, add2]
  }

  dimension: add1 {
    group_label: "수취인 지역"
    description: "시도"
    type: string
    sql:SUBSTRING_INDEX(${receiver_address}, ' ', 1)  ;;
  }

  dimension: add2 {
    group_label: "수취인 지역"
    description: "시군구"
    type: string
    sql:SUBSTRING_INDEX(SUBSTRING_INDEX(${receiver_address}, ' ', 2),' ', -1)  ;;
  }
  dimension: receiver_address {
    group_label: "수취인 지역"
    description: "수취인 주소"
    type: string
    sql: ${TABLE}.receiverAddress ;;
  }

  dimension: receiver_address_sub {
    group_label: "수취인 지역"
    description: "수취인 상세주소"
    type: string
    sql: ${TABLE}.receiverAddressSub ;;
  }

  dimension: receiver_zipcode {
    group_label: "수취인 지역"
    description: "수취인 우편번호"
    type: string
    sql: ${TABLE}.receiverZipcode ;;
  }

  dimension: receiver_zonecode {
    group_label: "수취인 지역"
    description: "수취인 우편번호(10자리)"
    type: string
    sql: ${TABLE}.receiverZonecode ;;
  }

  dimension: receiver_city {
    group_label: "수취인 지역"
    description: "수취인 도시"
    type: string
    sql: ${TABLE}.receiverCity ;;
  }

  dimension: receiver_state {
    group_label: "수취인 지역"
    description: "수취인 주/지방/지역"
    type: string
    sql: ${TABLE}.receiverState ;;
  }

  dimension_group: mod_dt {
    description: "수정일"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.modDt ;;
  }

  dimension_group: receiver_safe_number_dt {
    description: "수취인 안심번호 발급일자"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.receiverSafeNumberDt ;;
  }

  dimension_group: reg_dt {
    description: "등록일"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.regDt ;;
  }

  measure: count {
    label: "총 수"
    type: count
    drill_fields: [order_name, receiver_name]
  }

  measure:email_count  {
    label: "총 주문자 수"
    type: count_distinct
    sql: ${order_email} ;;
    filters: {
      field: es_order_goods.order_status
      value: "p1,g1,d1,d2,s1,b3,b1,b2,b4,r2,r1,z1,z2,z3,z4,z5"

    }
    drill_fields: [detail2*]
  }

  measure:receiver_address_count  {
    label: "총 배송지 수"
    type: count_distinct
    sql: concat(${receiver_address},${receiver_address_sub}) ;;
    filters: {
      field: es_order_goods.order_status
      value: "p1,g1,d1,d2,s1,b3,b1,b2,b4,r2,r1,z1,z2,z3,z4,z5"

    }
    drill_fields: [detail2*]
  }

  set: detail {
    fields: [es_order_goods.date, es_order_goods.sno, es_order_goods.order_no,es_order_goods.goods_brand,es_order_goods.goods_nm,es_order_goods.size,es_member.mem_id,es_member.age_tier,es_member.sex_fl,order_email,es_order_goods.order_status, es_order_goods.fixed_price,es_order_goods.goods_price,es_order_goods.basic_dc_price, es_order_goods.total_coupon_dc_2, es_order_goods.division_use_mileage,es_order_goods.time_sale_fl,es_order_goods.member_dc_price,es_order_goods.enuri,es_order_goods.total_dc_2,es_order_goods.total_payment_price_2,es_order_goods.total_dc_percent  ]
  }

  set: detail2 {
    fields: [sno,order_no,order_name,order_email,receiver_address,receiver_address_sub]
  }
}
