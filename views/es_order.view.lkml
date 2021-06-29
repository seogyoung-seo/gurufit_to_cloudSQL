view: es_order {
  sql_table_name: gurufit_to_looker.es_order ;;


  dimension: event_coupon_fl {
    description: "구매 쿠폰 지급여부"
    type: string
    sql: ${TABLE}.eventCouponFl ;;
  }


  dimension: first_coupon_fl {
    description: "첫구매 쿠폰 지급 여부"
    type: string
    sql: ${TABLE}.firstCouponFl ;;
  }

  dimension: first_sale_fl {
    description: "첫 구매 여부"
    type: string
    sql: ${TABLE}.firstSaleFl ;;
  }

  dimension: mem_no {
    description: "회원 번호"
    type: number
    sql: ${TABLE}.memNo ;;
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

  dimension: multi_shipping_fl {
    hidden: yes
    description: "복수배송지 사용여부"
    type: string
    sql: ${TABLE}.multiShippingFl ;;
  }

  dimension: order_channel_fl {
    description: "주문채널"
    type: string
    sql: ${TABLE}.orderChannelFl ;;
  }

  dimension: order_email {
    description: "비회원 이메일"
    type: string
    sql: ${TABLE}.orderEmail ;;
  }

  dimension: order_goods_cnt {
    description: "주문 상품 갯수"
    type: number
    sql: ${TABLE}.orderGoodsCnt ;;
  }

  dimension: order_goods_nm {
    description: "주문 상품명"
    type: string
    sql: ${TABLE}.orderGoodsNm ;;
  }

  dimension: order_goods_nm_standard {
    description: "주문 상품명(기준월)"
    type: string
    sql: ${TABLE}.orderGoodsNmStandard ;;
  }

  dimension: order_ip {
    description: "주문자 IP"
    type: string
    sql: ${TABLE}.orderIp ;;
  }

  dimension: order_no {
    description: "주문번호"
    primary_key: yes
    type: string
    sql: ${TABLE}.orderNo ;;
  }


  dimension: order_status {
    description: "주문상태"
    type: string
    sql: ${TABLE}.orderStatus ;;
  }

  dimension: order_type_fl {
    description: "주문 유형 (모바일,PC,수기)"
    type: string
    sql: ${TABLE}.orderTypeFl ;;
  }

  dimension: overseas_settle_currency {
    type: string
    sql: ${TABLE}.overseasSettleCurrency ;;
  }

  dimension: overseas_settle_price {
    type: number
    sql: ${TABLE}.overseasSettlePrice ;;
  }

  dimension_group: payment_dt {
    description: "입금일자"
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
    sql: ${TABLE}.paymentDt ;;
  }

  dimension: real_tax_free_price {
    hidden: yes
    description: "실제 총 면세 금액(환불제외)"
    type: number
    sql: ${TABLE}.realTaxFreePrice ;;
  }

  dimension: real_tax_supply_price {
    hidden: yes
    description: "실제 총 과세금액(환불제외)"
    type: number
    sql: ${TABLE}.realTaxSupplyPrice ;;
  }

  dimension: real_tax_vat_price {
    hidden: yes
    description: "실제 총 부가세(환불제외)"
    type: number
    sql: ${TABLE}.realTaxVatPrice ;;
  }

  dimension: receipt_fl {
    description: "영수증 신청여부"
    type: string
    sql: ${TABLE}.receiptFl ;;
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
      year,
      week_of_year,
      day_of_week_index
    ]
    sql: ${TABLE}.regDt ;;
  }

  dimension: week_start {
    type: string
    sql: DATE_ADD(${reg_dt_date}, INTERVAL (-${reg_dt_day_of_week_index}) DAY) ;;
  }

  dimension: send_mail_sms_fl {
    description: "메일/SMS 전송 여부"
    type: string
    sql: ${TABLE}.sendMailSmsFl ;;
  }

  dimension: settle_kind {
    description: "주문방법"
    type: string
    sql: case when ${TABLE}.settleKind='eb' then '에스크로 계좌이체'
          when ${TABLE}.settleKind='ec' then '에스크로 신용카드'
          when ${TABLE}.settleKind='ev' then '에스크로 가상계좌'
          when ${TABLE}.settleKind='fb' then '간편결제 계좌이체'
          when ${TABLE}.settleKind='fc' then '간편결제 신용카드'
          when ${TABLE}.settleKind='fh' then '간편결제 휴대폰'
          when ${TABLE}.settleKind='fp' then '간편결제 포인트'
          when ${TABLE}.settleKind='fv' then '간편결제 가상계좌'
          when ${TABLE}.settleKind='fa' then '간편결제 무통장입금'
          when ${TABLE}.settleKind='gb' then '무통장 입금'
          when ${TABLE}.settleKind='pb' then '계좌이체'
          when ${TABLE}.settleKind='pc' then '신용카드'
          when ${TABLE}.settleKind='ph' then '휴대폰'
          when ${TABLE}.settleKind='pv' then '가상계좌'
          when ${TABLE}.settleKind='pg' then '예치금'
          when ${TABLE}.settleKind='gm' then '마일리지'
          when ${TABLE}.settleKind='gz' then '전액할인'
          end;;
    }

    dimension: settle_price {
      description: "총 주문 금액"
      type: number
      sql: ${TABLE}.settlePrice ;;
    }

    dimension: status_policy {
      description: "주문상태 정책"
      type: string
      sql: ${TABLE}.statusPolicy ;;
    }

    dimension: tax_free_price {
      hidden: yes
      description: "최초 총 면세 금액"
      type: number
      sql: ${TABLE}.taxFreePrice ;;
    }

    dimension: tax_supply_price {
      hidden: yes
      description: "최초 총 과세 금액"
      type: number
      sql: ${TABLE}.taxSupplyPrice ;;
    }

    dimension: tax_vat_price {
      hidden: yes
      description: "최초 총 부가세 금액"
      type: number
      sql: ${TABLE}.taxVatPrice ;;
    }

    dimension: total_coupon_delivery_dc_price {
      hidden: yes
      description: "총 배송 쿠폰 할인 금액"
      type: number
      sql: ${TABLE}.totalCouponDeliveryDcPrice ;;
    }

    dimension: total_coupon_goods_dc_price {
      description: "총 상품 쿠폰 할인 금액"
      type: number
      sql: ${TABLE}.totalCouponGoodsDcPrice ;;
    }

    dimension: total_coupon_goods_mileage {
      description: "총 상품쿠폰 적립 마일리지"
      type: number
      sql: ${TABLE}.totalCouponGoodsMileage ;;
    }

    dimension: total_coupon_order_dc_price {
      description: "총 주문 쿠폰 할인 금액"
      type: number
      sql: ${TABLE}.totalCouponOrderDcPrice ;;
    }

    dimension: total_coupon_order_mileage {
      description: "총 주문쿠폰 적립 마일리지"
      type: number
      sql: ${TABLE}.totalCouponOrderMileage ;;
    }

    dimension: total_delivery_charge {
      description: "총 배송비"
      type: number
      sql: ${TABLE}.totalDeliveryCharge ;;
    }

    dimension: total_delivery_insurance_fee {
      hidden: yes
      description: "해외배송 EMS 보험료"
      type: number
      sql: ${TABLE}.totalDeliveryInsuranceFee ;;
    }

    dimension: total_delivery_weight {
      description: "배송 총 무게"
      type: number
      sql: ${TABLE}.totalDeliveryWeight ;;
    }

    dimension: total_enuri_dc_price {
      description: "총 운영자 추가할인"
      type: number
      sql: ${TABLE}.totalEnuriDcPrice ;;
    }

    dimension: total_goods_dc_price {
      description: "총 상품 할인금액"
      type: number
      sql: ${TABLE}.totalGoodsDcPrice ;;
    }

    dimension: total_goods_mileage {
      description: "총 상품 적립 마일리지"
      type: number
      sql: ${TABLE}.totalGoodsMileage ;;
    }

    dimension: total_goods_price {
      description: "총 상품 금액"
      type: number
      sql: ${TABLE}.totalGoodsPrice ;;
    }

    dimension: total_member_dc_price {
      description: "총 회원 할인 금액"
      type: number
      sql: ${TABLE}.totalMemberDcPrice ;;
    }

    dimension: total_member_delivery_dc_price {
      description: "회원 배송비 무료"
      type: number
      sql: ${TABLE}.totalMemberDeliveryDcPrice ;;
    }

    dimension: total_member_mileage {
      description: "총 회원 적립 마일리지"
      type: number
      sql: ${TABLE}.totalMemberMileage ;;
    }

    dimension: total_member_overlap_dc_price {
      description: "총 그룹별 회원 중복 할인 금액"
      type: number
      sql: ${TABLE}.totalMemberOverlapDcPrice ;;
    }

    dimension: total_mileage {
      description: "총 적립 마일리지"
      type: number
      sql: ${TABLE}.totalMileage ;;
    }

    dimension: tracking_key {
      description: "페이코 쇼핑 트래킹 키"
      type: string
      sql: ${TABLE}.trackingKey ;;
    }

    dimension: use_deposit {
      description: "주문시 사용한 예치금"
      type: number
      sql: ${TABLE}.useDeposit ;;
    }

    dimension: use_mileage {
      description: "주문시 사용한 마일리지"
      type: number
      sql: ${TABLE}.useMileage ;;
    }

    dimension: user_consult_memo {
      description: "고객상담메모(관리자용메모)"
      type: string
      sql: ${TABLE}.userConsultMemo ;;
    }

    dimension: user_request_memo {
      description: "고객요청메모(관리자용메모)"
      type: string
      sql: ${TABLE}.userRequestMemo ;;
    }

    dimension: mileage_rate {
      type: number
      sql: ${use_mileage}/NULLIF(${total_goods_price},0) ;;
      value_format_name: decimal_2
    }

    measure: total_payment_price{
      type: sum
      sql: ${settle_price} ;;
      value_format_name: decimal_0
      drill_fields: [detail*]
    }

    measure: total_sales_price{
      type: sum
      sql: ${total_goods_price} ;;
      value_format_name: decimal_0
      drill_fields: [detail*]
    }
    measure: order_count {
      type: count
      value_format_name: decimal_0
      drill_fields: [detail*]

    }

    measure: order_distinct_count {
      type: count_distinct
      sql: ${order_no} ;;
      value_format_name: decimal_0
      drill_fields: [detail*]

    }

    measure: distinct_member_count {
      type: count_distinct
      sql: ${mem_no} ;;
      value_format_name: decimal_0
      drill_fields: [detail*]

    }

    measure: member_count {
      type: count
      value_format_name: decimal_0
      drill_fields: [detail*]

    }


    measure: average_payment_price {
      type: average
      sql: ${settle_price} ;;
      value_format_name: decimal_2
      drill_fields: [detail*]
    }


    measure: average_sales_price {
      type: average
      sql: ${total_goods_price} ;;
      value_format_name: decimal_2
      drill_fields: [detail*]
    }

    measure: goods_count {
      type: sum
      sql: ${order_goods_cnt} ;;
      value_format_name: decimal_0
    }


    measure: first_count {
      type: count_distinct
      sql: ${order_no}  ;;
      filters: {
        field: first_sale_fl
        value: "y"
      }
    }

    measure: not_first_count {
      type: count_distinct
      sql: ${order_no}  ;;
      filters: {
        field: first_sale_fl
        value: "n"
      }
    }

    set: detail {
      fields: [order_no,mem_no,order_ip,order_type_fl,order_email,order_goods_nm,order_goods_cnt,settle_price,payment_dt_date]
    }
  }
