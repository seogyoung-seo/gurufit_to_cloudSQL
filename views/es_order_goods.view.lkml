view: es_order_goods {

  sql_table_name: gurufit_to_looker.es_orderGoods ;;

############################################################################# 주문 정보
  #dimension: performance_filter {
  # hidden: yes
  #group_label: "주문 정보"
  #label: "주문 상태 필터"
  #type: yesno
  #sql: ${order_status} in ("p1","g1","d1","d2","s1","b3","b1","b2","b4","r3","r2","r1","z1","z2","z3","z4","z5") ;;
  #}

  dimension: order_no {
    group_label: "주문 정보"
    label: "주문번호"
    type: string
    sql: ${TABLE}.orderNo ;;
  }

  dimension: plus_yesno {
    group_label: "주문 정보"
    label: "플러스 회원권 구매 이후 구매"
    type: yesno
    sql: ${payment_dt_date}> DATE_ADD(${es_member.group_mod_dt_date}, INTERVAL -1 DAY) ;;
  }
  dimension: order_status {
    group_label: "주문 정보"
    label: "주문 상태"
    type: string
    sql: ${TABLE}.orderStatus ;;
  }

  dimension: order_type {
    group_label: "주문 정보"
    label: "주문 유형(일반/교환)"
    type: string
    sql:
    case when ${handle_sno}>0 and ${order_status} in ("p1","g1","d1","d2","s1") then "교환"
    else "일반"
    end;;
  }

  dimension: sno {
    group_label: "주문 정보"
    label: "일련번호"
    primary_key: yes
    type: number
    sql: ${TABLE}.sno ;;
  }

  dimension: order_cd {
    group_label: "주문 정보"
    label: "주문 코드(순서)"
    type: number
    sql: ${TABLE}.orderCd ;;
  }

  dimension: goods_cnt {
    group_label: "주문 정보"
    label: "상품 수량"
    type: number
    sql: ${TABLE}.goodsCnt ;;
  }

  dimension: order_status_type {
    group_label: "주문 정보"
    type: string
    sql: case when ${order_status} in ("o1") then "입금대기"
        when ${order_status} in ("p1") then "결제완료"
        when ${order_status} in ("g1") then "상품준비중"
        when ${order_status} in ("g2") then "구매발주"
        when ${order_status} in ("g3") then "상품입고"
        when ${order_status} in ("g4") then "상품출고"
        when ${order_status} in ("d1") then "배송중"
        when ${order_status} in ("d2") then "배송완료"
        when ${order_status} in ("s1") then "구매확정"
        when ${order_status} in ("c2") then "품절취소"
        when ${order_status} in ("c3") then "관리자취소"
        when ${order_status} in ("c4") then "고객요청취소"
        when ${order_status} in ("f1") then "결제시도"
        when ${order_status} in ("f2") then "고객결제중단"
        when ${order_status} in ("f3","c1") then "결제실패"
        when ${order_status} in ("b1") then "반품접수"
        when ${order_status} in ("b2") then "반품반송중"
        when ${order_status} in ("b3") then "반품보류"
        when ${order_status} in ("b4") then "반품회수완료"
        when ${order_status} in ("e1") then "교환접수"
        when ${order_status} in ("e2") then "교환회수중"
        when ${order_status} in ("e3") then "재배송중"
        when ${order_status} in ("e4") then "교환보류"
        when ${order_status} in ("e5") then "교환회수완료"
        when ${order_status} in ("r1") then "환불접수"
        when ${order_status} in ("r2") then "환불보류"
        when ${order_status} in ("r3") then "환불완료"
        when ${order_status} in ("z1") then "교환준비중"
        when ${order_status} in ("z2") then "추가결제완료"
        when ${order_status} in ("z3") then "교환배송중"
        when ${order_status} in ("z4") then "교환배송완료"
        when ${order_status} in ("z5") then "교환완료"
    end
          ;;
  }

############################################################################# 상품 정보

  dimension: size {
    group_label: "상품 정보"
    type: string
    sql: case when replace(replace(SUBSTRING_INDEX(SUBSTRING_INDEX(${option_info},',',2),',',-1),'\\',''),'\"','')='' then '알 수 없음'
          when replace(replace(SUBSTRING_INDEX(SUBSTRING_INDEX(${option_info},',',2),',',-1),'\\',''),'\"','') like 'OS%' then '알 수 없음'
          else SUBSTRING_INDEX(replace(replace(SUBSTRING_INDEX(SUBSTRING_INDEX(${option_info},',',2),',',-1),'\\',''),'\"',''),'(',1) end
          ;;
  }

  dimension: sale_cate {
    group_label: "상품 정보"
    label: "일반 / 타임세일 / SALE / 회원권 + 플러스존"
    type: string
    sql: case when ${time_sale_fl}='y' then "타임세일"
        when ${cate_cd}='010' then "SALE"
        when ${cate_cd}='044' OR ${cate_cd}='043' then "회원권 + 플러스존"
        else "일반"
        end
        ;;
  }

  dimension: brand_cd {
    group_label: "상품 정보"
    label: "브랜드 코드"
    type: string
    sql: ${TABLE}.brandCd ;;
  }

  dimension: cate_cd {
    group_label: "상품 정보"
    label: "카테고리 코드"
    type: string
    sql: ${TABLE}.cateCd ;;
  }

  dimension: goods_cd {
    group_label: "상품 정보"
    label: "상품 코드"
    type: string
    sql: ${TABLE}.goodsCd ;;
  }

  dimension: pluszone_yesno {
    group_label: "상품 정보"
    label: "플러스존 상품 여부"
    type: string
    sql: case when ${cate_cd}='044' then '플러스존 상품'
          else '일반상품'
          end;;
  }

  dimension: goods_model_no {
    group_label: "상품 정보"
    label: "모델명"
    type: string
    sql: ${TABLE}.goodsModelNo ;;
  }

  dimension: goods_nm {
    group_label: "상품 정보"
    label: "상품명"
    type: string
    sql: ${TABLE}.goodsNm ;;
  }

  dimension: goods_brand {
    group_label: "상품 정보"
    label: "브랜드"
    type: string
    sql: ${es_category_brand.cate_nm} ;;
  }

  dimension: time_sale_fl {
    group_label: "상품 정보"
    type: string
    sql: ${TABLE}.timeSaleFl ;;
  }

  dimension: goods_nm_standard {
    group_label: "상품 정보"
    label: "기준몰 상품명"
    type: string
    sql: ${TABLE}.goodsNmStandard ;;
  }

  dimension: goods_no {
    group_label: "상품 정보"
    label: "상품 번호"
    type: number
    sql: ${TABLE}.goodsNo ;;
  }

  dimension: goods_weight {
    group_label: "상품 정보"
    label: "상품 무게"
    type: number
    sql: ${TABLE}.goodsWeight ;;
  }

############################################################################# 금액 정보

  dimension: payment_price {
    group_label: "금액 정보"
    type: number
    hidden: no
    sql:${goods_price}-${enuri}-${member_dc_price}-${division_use_mileage}-${division_coupon_order_dc_price}-${coupon_goods_dc_price}  ;;
  }

  dimension: dc_price_rate_hidden {
    group_label: "참고용"
    hidden: no
    label: "이익률 산출용 할인률"
    type: number
    sql:
    case when ${es_goods.purchase_no}='100009'
    then ${es_goods.lesmore_dc_rate}/100
    when ${es_goods.purchase_no} in ('100003','100004','100005','100006','100007','100008','100010','100011','100012','100013','100014','100015')
    then (${coupon_goods_dc_price}+${division_coupon_order_dc_price}+${basic_dc_price}+${timesale_dc_price})/${fixed_price}
    when ${es_goods.purchase_no}='100001'
    then (${coupon_goods_dc_price}+${division_coupon_order_dc_price}+${basic_dc_price}+${timesale_dc_price}+${division_use_mileage})/${fixed_price}
    else null
    end;;
  }

  dimension: fee_price {
    group_label: "참고용"
    hidden: no
    label: "판매대금"
    type: number
    sql:
    if((${order_status} in ("p1","g1","d1","d2","s1","b3","b1","b2","b4","r2","r1","e1","e2","e3","e4","e5")) and (${order_type}='일반'),
    case
    when ${es_goods.purchase_no}='100009' and ${es_goods.brandcate_cd}='GB' and ${dc_price_rate_hidden}<0.2 and ${payment_dt_date} < '2019-09-01'
    then ${fixed_price}*0.55
    when ${es_goods.purchase_no}='100009' and ${es_goods.brandcate_cd}='GB' and ${dc_price_rate_hidden}<0.2 and ${payment_dt_date} >= '2019-09-01'
    then ${fixed_price}*0.52
    when ${es_goods.purchase_no}='100009' and ${es_goods.brandcate_cd}='GB' and ${dc_price_rate_hidden}<0.4 and ${dc_price_rate_hidden}>=0.2 and ${payment_dt_date} < TIMESTAMP('2019-12-31 08:00')
    then ${fixed_price}*0.5
    when ${es_goods.purchase_no}='100009' and ${es_goods.brandcate_cd}='GB' and ${dc_price_rate_hidden}<0.4 and ${dc_price_rate_hidden}>=0.2 and ${payment_dt_date} >= TIMESTAMP('2019-12-31 08:00')
    then ${fixed_price}*0.47
    when ${es_goods.purchase_no}='100009' and ${es_goods.brandcate_cd}='GB' and ${dc_price_rate_hidden}>=0.4 and ${payment_dt_hour} < TIMESTAMP('2019-10-31 08:00')
    then ${fixed_price}*0.35
    when ${es_goods.purchase_no}='100009' and ${es_goods.brandcate_cd}='GB' and ${dc_price_rate_hidden}>=0.4 and ${payment_dt_hour} >= TIMESTAMP('2019-10-31 08:00')
    then ${fixed_price}*0.25
    when ${es_goods.purchase_no}='100009' and ${es_goods.brandcate_cd}='KB' and ${dc_price_rate_hidden}<0.2 and ${payment_dt_date} < '2019-09-01'
    then ${fixed_price}*0.35
    when ${es_goods.purchase_no}='100009' and ${es_goods.brandcate_cd}='KB' and ${dc_price_rate_hidden}<0.2 and ${payment_dt_date} >= '2019-09-01'
    then ${fixed_price}*0.36
    when ${es_goods.purchase_no}='100009' and ${es_goods.brandcate_cd}='KB' and ${dc_price_rate_hidden}<0.4 and ${dc_price_rate_hidden}>=0.2 and ${payment_dt_date} < TIMESTAMP('2019-12-31 08:00')
    then ${fixed_price}*0.3
    when ${es_goods.purchase_no}='100009' and ${es_goods.brandcate_cd}='KB' and ${dc_price_rate_hidden}<0.4 and ${dc_price_rate_hidden}>=0.2 and ${payment_dt_date} >= TIMESTAMP('2019-12-31 08:00')
    then ${fixed_price}*0.27
    when ${es_goods.purchase_no}='100009' and ${es_goods.brandcate_cd}='KB' and ${dc_price_rate_hidden}>=0.4 and ${payment_dt_hour} < TIMESTAMP('2019-10-31 08:00')
    then ${fixed_price}*0.2
    when ${es_goods.purchase_no}='100009' and ${es_goods.brandcate_cd}='KB' and ${dc_price_rate_hidden}>=0.4 and ${payment_dt_hour}>= TIMESTAMP('2019-10-31 08:00')
    then ${fixed_price}*0.15
    when ${es_goods.purchase_no} in ('100007','100003') and ${dc_price_rate_hidden}<0.1
    then (${goods_price}-${division_coupon_order_dc_price}-${coupon_goods_dc_price})*0.7
    when ${es_goods.purchase_no} in ('100007','100003') and ${dc_price_rate_hidden}>=0.1 and ${dc_price_rate_hidden}<0.2
    then (${goods_price}-${division_coupon_order_dc_price}-${coupon_goods_dc_price})*0.725
    when ${es_goods.purchase_no} in ('100007','100003') and ${dc_price_rate_hidden}>=0.2
    then (${goods_price}-${division_coupon_order_dc_price}-${coupon_goods_dc_price})*0.75
    when ${es_goods.purchase_no}='100005' and ${dc_price_rate_hidden}<=0.2
    then (${goods_price}-${division_coupon_order_dc_price}-${coupon_goods_dc_price})*0.7
    when ${es_goods.purchase_no}='100005' and ${dc_price_rate_hidden}>0.2 and ${dc_price_rate_hidden}<=0.4
    then (${goods_price}-${division_coupon_order_dc_price}-${coupon_goods_dc_price})*0.72
    when ${es_goods.purchase_no}='100005' and ${dc_price_rate_hidden}>0.4
    then (${goods_price}-${division_coupon_order_dc_price}-${coupon_goods_dc_price})*0.75
    when ${es_goods.purchase_no} in ('100010','100004','100014','100015')
    then (${goods_price}-${division_coupon_order_dc_price}-${coupon_goods_dc_price})*0.7
    when ${es_goods.purchase_no}='100006'
    then (${goods_price}-${division_coupon_order_dc_price}-${coupon_goods_dc_price})*0.72
    when ${es_goods.purchase_no}='100008'
    then (${goods_price}-${division_coupon_order_dc_price}-${coupon_goods_dc_price})*0.45
    when ${es_goods.purchase_no}='100011'
    then (${goods_price}-${division_coupon_order_dc_price}-${coupon_goods_dc_price})*0.75
    when ${es_goods.purchase_no}='100012'
    then (${goods_price}-${division_coupon_order_dc_price}-${coupon_goods_dc_price})*0.70
    when ${es_goods.purchase_no}='100013'
    then (${goods_price}-${division_coupon_order_dc_price}-${coupon_goods_dc_price})*0.78
    when ${es_goods.purchase_no}='100021'
    then (${goods_price}-${division_coupon_order_dc_price}-${coupon_goods_dc_price})*0.6
    else null
    end,
    null);;
  }

  dimension: pg_price {
    group_label: "참고용"
    hidden: no
    label: "PG수수료"
    type: number
    sql: if((${order_status} in ("p1","g1","d1","d2","s1","b3","b1","b2","b4","r2","r1","r3","e1","e2","e3","e4","e5")) and (${order_type}='일반'),
          case
          when ${payment_dt_date} < '2019-08-01' and (${es_order.settle_kind}='신용카드') and ${order_status} in ("p1","g1","d1","d2","s1","b3","b1","b2","b4","r2","r1","e1","e2","e3","e4","e5")
          then TRUNCATE(${payment_price}*0.022,0)
          when ${payment_dt_date} < '2019-08-01' and (${es_order.settle_kind}='신용카드') and (${order_status} in ("r3"))
          then 0
          when ${payment_dt_date} >= '2019-08-01' and ${es_order.settle_kind}='신용카드' and ${order_status} in ("p1","g1","d1","d2","s1","b3","b1","b2","b4","r2","r1","e1","e2","e3","e4","e5")
          then TRUNCATE(${payment_price}*0.028,0)
          when ${payment_dt_date} >= '2019-08-01' and ${es_order.settle_kind}='신용카드' and (${order_status} in ("r3"))
          then 0
          when ${es_order.settle_kind}='에스크로 계좌이체' and ${es_order.order_goods_cnt}=1 and ${payment_dt_date}=${mod_dt_date} and (${order_status} in ("r3"))
          then 0
          when ${es_order.settle_kind}='에스크로 계좌이체' and  ${order_status} in ("p1","g1","d1","d2","s1","b3","b1","b2","b4","r2","r1","e1","e2","e3","e4","e5")
          then TRUNCATE(${payment_price}*0.018,0)
          when ${es_order.settle_kind}='에스크로 가상계좌' and ${order_status} in ("p1","g1","d1","d2","s1","b3","b1","b2","b4","r2","r1","e1","e2","e3","e4","e5")
          then 300
          when ${es_order.settle_kind}='에스크로 가상계좌' and (${order_status} in ("r3"))
          then 600
          when ${es_order.settle_kind}='휴대폰' and ${payment_dt_month}!=${mod_dt_date} and ${order_status} in ("p1","g1","d1","d2","s1","b3","b1","b2","b4","r2","r1","r3","e1","e2","e3","e4","e5")
          then TRUNCATE(${payment_price}*0.0375,0)
          when ${es_order.settle_kind}='휴대폰' and ${payment_dt_month}=${mod_dt_date} and (${order_status} in ("r3"))
          then 0
          else 0
          end,
          null)
           ;;
  }

  measure: fee_price_sum {
    hidden: no
    label: "이익률 산출용 판매대금 합"
    type: sum
    sql:${fee_price};;
  }

  measure: pg_price_sum {
    hidden: no
    label: "이익률 산출용 pg수수료"
    type: sum
    sql:${pg_price};;
  }

  # measure: profit_price {
  #   hidden: yes
  #   label: "이익률 산출용 매출 총 이익"
  #   type: sum
  #   sql:${payment_price}-${fee_price}-(${payment_price}*0.034);;
  #   filters: {
  #     field: order_status
  #     value: "p1,g1,d1,d2,s1,b3,b1,b2,b4,r2,r1,r3,z1,z3,z4,z5"
  #   }
  # }

  dimension: fixed_price {
    group_label: "금액 정보"
    label: "정가"
    type: number
    sql: ${TABLE}.fixedPrice ;;
  }

  dimension: goods_price {
    group_label: "금액 정보"
    label: "상품 가격"
    type: number
    sql: ${TABLE}.goodsPrice ;;
  }

  dimension: basic_dc_price {
    group_label: "금액 정보"
    label: "기본 할인 금액"
    type: number
    sql: case when ${time_sale_fl}='n' then ${fixed_price}-${goods_price}
          else 0
          end;;
    }

  dimension: timesale_dc_price {
    group_label: "금액 정보"
    label: "타임세일 할인 금액"
    type: number
    sql: case when ${time_sale_fl}='y' then ${fixed_price}-${goods_price}
        else 0
        end;;
  }

  dimension: coupon_goods_dc_price {
    group_label: "금액 정보"
    label: "상품쿠폰 할인 금액"
    type: number
    sql: ${TABLE}.couponGoodsDcPrice ;;
  }

  dimension: division_coupon_order_dc_price {
    group_label: "금액 정보"
    label: "주문할인 금액의 안분된 주문쿠폰"
    type: number
    sql: ${TABLE}.divisionCouponOrderDcPrice ;;
  }

  dimension: division_use_deposit {
    group_label: "금액 정보"
    label: "주문할인 금액의 안분된 예치금"
    type: number
    sql: ${TABLE}.divisionUseDeposit ;;
  }

  dimension: division_use_mileage {
    group_label: "금액 정보"
    label: "  주문할인 금액의 안분된 적립금"
    type: number
    sql: ${TABLE}.divisionUseMileage ;;
  }

  dimension: enuri {
    group_label: "금액 정보"
    label: "에누리 할인"
    type: number
    sql: ${TABLE}.enuri ;;
  }

  dimension: goods_dc_price {
    group_label: "금액 정보"
    label: "상품 할인 금액"
    type: number
    sql: ${TABLE}.goodsDcPrice ;;
  }

  dimension: member_dc_price {
    group_label: "금액 정보"
    label: "회원 할인 금액"
    type: number
    sql: ${TABLE}.memberDcPrice ;;
  }

############################################################################# 마일리지 적립 관련 정보
  dimension: coupon_goods_mileage {
    group_label: "적립금 정보"
    label: "상품쿠폰 적립 적립금"
    type: number
    sql: ${TABLE}.couponGoodsMileage ;;
  }


  dimension: division_coupon_order_mileage {
    group_label: "적립금 정보"
    label: "주문금액의 안분된 적립금"
    type: number
    sql: ${TABLE}.divisionCouponOrderMileage ;;
  }


  dimension: goods_mileage {
    group_label: "적립금 정보"
    label: "상품 적립금"
    type: number
    sql: ${TABLE}.goodsMileage ;;
  }

  dimension: member_mileage {
    group_label: "적립금 정보"
    label: "회원 적립금"
    type: number
    sql: ${TABLE}.memberMileage ;;
  }

  dimension: plus_mileage_fl {
    group_label: "적립금 정보"
    label: "적립금 지급 여부"
    type: string
    sql: ${TABLE}.plusMileageFl ;;
  }

  dimension: plus_restore_mileage_fl {
    group_label: "적립금 정보"
    label: "적립금 복원 여부"
    type: string
    sql: ${TABLE}.plusRestoreMileageFl ;;
  }


############################################################################# 그룹

  dimension: goods_brand_tier {
    group_label: "그룹"
    label: "상품 브랜드 Tier"
    type: string
    sql: case when SUBSTRING_INDEX(${goods_nm}, ' ', 1)='컨버스' THEN '1컨버스'
              when SUBSTRING_INDEX(${goods_nm}, ' ', 1)='엑셀시오르' THEN '2엑셀시오르'
              when SUBSTRING_INDEX(${goods_nm}, ' ', 1)='아디다스' THEN '3아디다스'
              when SUBSTRING_INDEX(${goods_nm}, ' ', 1)='에이지' THEN '4에이지'
              when SUBSTRING_INDEX(${goods_nm}, ' ', 1)='휠라' THEN '5휠라'
              else '6기타'
       END
    ;;
  }

  dimension: price_tier {
    group_label: "그룹"
    label: "가격대"
    type: string
    sql: case when ${fixed_price}<=50000 THEN ' 0-5만원'
               when 50000<${fixed_price} AND ${fixed_price}<=80000 THEN ' 5-8만원'
               when 80000<${fixed_price} AND ${fixed_price}<=100000 THEN ' 8-10만원'
               when 10000<${fixed_price} AND ${fixed_price}<=130000 THEN '10-13만원'
               when 130000<${fixed_price} AND ${fixed_price}<=150000 THEN '13-15만원'
               when 150000<${fixed_price} AND ${fixed_price}<=200000 THEN '15-20만원'
                  else '20만원이상'
       END
    ;;
  }

  dimension: order_state_tier {
    group_label: "그룹"
    label: "주문 상태 Tier(실주문/교환/반품/환불/구매이탈/기타)"
    type: string
    sql: case when ${order_status} IN ("p1","g1","d1","d2","s1") THEN '1실주문'
              when ${order_status} IN ("e1","z1","z3","z4", "z5") THEN '2교환'
              when ${order_status} IN ("b1","b2","b3","b4") THEN '3반품'
              when ${order_status} IN ("r1","r3") THEN '4환불'
              when ${order_status} IN ("f1","f2","f3","c1","c4") THEN '5구매이탈'
              else '6기타'
       END  ;;

  }

  dimension: payment_dt_hour_tier {
    group_label: "그룹"
    label: "주문 시간 Tier"
    type: string
    sql: case when ${payment_dt_hour_of_day}>=1 and ${payment_dt_hour_of_day}<=6 then "1새벽(1~6)"
              when ${payment_dt_hour_of_day}>=7 and ${payment_dt_hour_of_day}<=12 then "2오전(7~12)"
              when ${payment_dt_hour_of_day}>=13 and ${payment_dt_hour_of_day}<=18 then "3오후(13~~18)"
              when (${payment_dt_hour_of_day}>=19 and ${payment_dt_hour_of_day}<=23) or ${payment_dt_hour_of_day}=0 then "4저녁(19~24)"
              else "5알수없음"
          end;;
  }

  dimension : coupon_mileage_tier {
    group_label: "그룹"
    label: "쿠폰/적립금 사용 Tier"
    type: string
    sql: case when (${division_coupon_order_dc_price}+${coupon_goods_dc_price})>0 and ${division_use_mileage}>0 THEN '4쿠폰&적립금 사용'
              when (${division_coupon_order_dc_price}+${coupon_goods_dc_price})>0 and ${division_use_mileage}=0  THEN '1쿠폰 사용'
              when (${division_coupon_order_dc_price}+${coupon_goods_dc_price})=0 and ${division_use_mileage}>0  THEN '2적립금 사용'
              else '3쿠폰&적립금 미사용'
          end
    ;;
  }

  dimension: coupon_yesno {
    group_label: "그룹"
    label: "쿠폰 사용여부"
    type: yesno
    sql: (${division_coupon_order_dc_price}+${coupon_goods_dc_price})>0 ;;
  }

  dimension: mileage_yesno {
    group_label: "그룹"
    label: "적립금 사용여부"
    type: yesno
    sql: ${division_use_mileage}>0  ;;
  }

############################################################################# sno

  dimension: order_delivery_sno {
    group_label: "일련번호"
    label: "배송테이블 sno"
    type: number
    sql: ${TABLE}.orderDeliverySno ;;
  }

  dimension: handle_sno {
    group_label: "일련번호"
    label: "환불/반품/교환 처리 SNO"
    type: number
    sql: ${TABLE}.handleSno ;;
  }

  dimension: user_handle_sno {
    group_label: "일련번호"
    label: "사용자 처리 코드 (SNO)"
    type: number
    sql: ${TABLE}.userHandleSno ;;
  }

############################################################################# 날짜1

  dimension: date {
    group_label: "날짜 정보"
    label: "주문 일자+요일"
    type: string
    sql: concat(${payment_dt_date}," (",${day_of_week_hangle},")") ;;
  }

  dimension: reporting_period {
    group_label: "날짜 정보"
    label: "이번달 지난달 비교"
    sql: IF(SUBSTRING(DATE_ADD(current_date, INTERVAL -1 DAY),6,2)="01" ,
            CASE WHEN SUBSTRING(${payment_dt_date},1,7) = SUBSTRING(DATE_ADD(current_date, INTERVAL -1 DAY),1,7)
                      and SUBSTRING(${payment_dt_date},9,2) <= SUBSTRING(DATE_ADD(current_date, INTERVAL -1 DAY),9,2)
                  THEN 'This Month to Date'
                 WHEN SUBSTRING(${payment_dt_date},1,4)+1 = SUBSTRING(DATE_ADD(current_date, INTERVAL -1 DAY),1,4)
                      and SUBSTRING(${payment_dt_date},6,2)='12'
                      and SUBSTRING(${payment_dt_date},9,2) <= SUBSTRING(DATE_ADD(current_date, INTERVAL -1 DAY),9,2)
                  THEN 'Last Month to Date'
             END
          ,CASE WHEN SUBSTRING(${payment_dt_date},1,7)  = SUBSTRING(DATE_ADD(current_date, INTERVAL -1 DAY),1,7)
                     and SUBSTRING(${payment_dt_date},9,2) <= SUBSTRING(DATE_ADD(current_date, INTERVAL -1 DAY),9,2)
                  THEN 'This Month to Date'
                WHEN SUBSTRING(${payment_dt_date},1,4) = SUBSTRING(DATE_ADD(current_date, INTERVAL -1 DAY),1,4)
                     and SUBSTRING(${payment_dt_date},6,2)+1 = SUBSTRING(DATE_ADD(current_date, INTERVAL -1 DAY),6,2)
                     and SUBSTRING(${payment_dt_date},9,2) <= SUBSTRING(DATE_ADD(current_date, INTERVAL -1 DAY),9,2)
                  THEN 'Last Month to Date'
            END
         );;
  }

  dimension: day_of_week_hangle {
    group_label: "날짜 정보"
    hidden: yes
    type: string
    sql: case when ${payment_dt_day_of_week}="Monday" then "월"
              when ${payment_dt_day_of_week}="Tuesday" then "화"
              when ${payment_dt_day_of_week}="Wednesday" then "수"
              when ${payment_dt_day_of_week}="Thursday" then "목"
              when ${payment_dt_day_of_week}="Friday" then "금"
              when ${payment_dt_day_of_week}="Saturday" then "토"
              when ${payment_dt_day_of_week}="Sunday" then "일"
         ELSE  "알 수 없음" end
          ;;
  }

  dimension: week_start {
    group_label: "날짜 정보"
    label: "주 시작일"
    type: string
    sql: DATE_ADD(${payment_dt_date}, INTERVAL (-${payment_dt_day_of_week_index}) DAY) ;;
  }

  dimension: week_index {
    group_label: "날짜 정보"
    label: "W주번호"
    type: string
    sql:concat("W",${es_order_goods.payment_dt_week_of_year},"_",${es_order_goods.week_start});;
  }

  dimension: cur_day {
    group_label: "날짜 정보"
    hidden: yes
    type: yesno
    sql: ${payment_dt_day_of_week} = dayname(curdate()) ;;
  }

  dimension: delivery_day {
    group_label: "날짜 정보"
    label: "배송완료일 - 결제일"
    type: number
    sql: case when ${order_status} in ("d2","s1") then DATEDIFF(${delivery_complete_dt_date},${payment_dt_date})
          else null
          end;;
  }

############################################################################# 날짜2

  dimension_group: cancel_dt {
    label: "취소완료일자"
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
    sql: ${TABLE}.cancelDt ;;
  }

  dimension_group: delivery_complete_dt {
    label: "배송완료일자"
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
    sql: ${TABLE}.deliveryCompleteDt ;;
  }

  dimension_group: delivery_dt {
    label: "배송일자"
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
    sql: ${TABLE}.deliveryDt ;;
  }

  dimension_group: finish_dt {
    label: "구매확정일자"
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
    sql: ${TABLE}.finishDt ;;
  }

  dimension_group: payment_dt {
    label: "입금일자"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
      month_num,
      week_of_year,
      hour_of_day,
      day_of_week,
      day_of_week_index,
      hour
    ]
    #sql: ${es_order_pay_history.pay_dt};;
    sql: if(${TABLE}.paymentDt='0000-00-00',${TABLE}.regDt,${TABLE}.paymentDt) ;;
  }

  dimension_group: mileage_give_dt {
    label: "마일리지 지급 유예에 따른 실 지급일"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.mileageGiveDt ;;
  }

  dimension_group: reg_dt {
    label: "등록일"
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
      hour_of_day,
      day_of_week,
      day_of_week_index
    ]
    sql: ${TABLE}.regDt ;;
  }

  dimension_group: mod_dt {
    label: "수정일"
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

############################################################################# 시간 비교용
  filter: timeframe_a {
    type: date_time
  }

  dimension: group_a_yesno {
    hidden: yes
    type: yesno
    sql: {% condition timeframe_a %} ${payment_dt_raw} {% endcondition %} ;;
  }

  filter: timeframe_b {
    type: date_time
  }

  dimension: group_b_yesno {
    hidden: yes
    type: yesno
    sql: {% condition timeframe_b %} ${payment_dt_raw} {% endcondition %} ;;
  }

  dimension: is_in_time_a_or_b {
    hidden: yes
    group_label: "Time Comparison Filters"
    type: yesno
    sql:
    {% condition timeframe_a %} ${payment_dt_raw} {% endcondition %} OR
    {% condition timeframe_b %} ${payment_dt_raw} {% endcondition %} ;;
  }

############################################################################# measure

  measure: avg_delivery_day {
    type: average
    label: "평균 배송 소요일"
    sql: ${delivery_day};;
    drill_fields : [detail*]
  }

  measure: goods_count {
    type: count_distinct
    label: "총 주문 족 수"
    sql: ${sno} ;;
    filters: {
      field: order_status
      value: "p1,g1,d1,d2,s1,b3,b1,b2,b4,r2,r1,r3,z1,z2,z3,z4,z5,e1,e2,e3,e4,e5"
    }
    filters: {
      field: order_type
      value: "일반"
    }
    drill_fields : [detail*]
  }

  measure: goods_count_all {
    hidden: yes
    type: sum
    label: "총 족 수"
    sql: ${goods_cnt};;
    drill_fields : [detail*]
  }

  measure: real_goods_count {
    type: sum
    hidden: yes
    sql: ${goods_cnt} ;;
    filters: {
      field: order_status
      value: "p1,g1,d1,d2,s1,b3,b1,b2,b4,r2,r1,r3,z1,z2,z3,z4,z5"
    }
    drill_fields : [detail*]
  }

  measure: real_order_count {
    hidden: yes
    type: count
    filters: {
      field: order_status
      value: "p1,g1,d1,d2,s1,b3,b1,b2,b4,r2,r1,r3,z1,z2,z3,z4,z5"
    }
    drill_fields : [detail*]
  }

  measure: order_distinct_count {
    label: "총 주문 수"
    type: count_distinct
    sql: ${order_no} ;;
    filters: {
      field: order_status
      value: "p1,g1,d1,d2,s1,b3,b1,b2,b4,r2,r1,r3,z1,z2,z3,z4,z5,e1,e2,e3,e4,e5"
    }
    filters: {
      field: order_type
      value: "일반"
    }

    drill_fields : [detail*]
  }

  # measure: order_distinct_count_1 {
  #   hidden: yes
  #   label: "총 주문 수(이탈)"
  #   type: count_distinct
  #   sql: ${order_no} ;;
  #   drill_fields : [detail*]
  # }

  measure: total_sales_price {
    label: "총 매출(정가)(단위 천원)"
    type: sum
    sql: ${fixed_price} ;;
    value_format: "#,##0,"
    filters: {
      field: order_status
      value: "p1,g1,d1,d2,s1,b3,b1,b2,b4,r2,r1,z1,z2,z3,z4,z5,e1,e2,e3,e4,e5"
    }
    filters: {
      field: order_type
      value: "일반"
    }

    drill_fields : [detail*]
  }

  measure: total_sales_price_2 {
    label: "총 매출(정가)(단위 원)"
    type: sum
    sql: ${fixed_price} ;;
    value_format: "#,##0"
    filters: {
      field: order_status
      value: "p1,g1,d1,d2,s1,b3,b1,b2,b4,r2,r1,z1,z2,z3,z4,z5,e1,e2,e3,e4,e5"

    }
    filters: {
      field: order_type
      value: "일반"
    }

    drill_fields : [detail*]
  }

  measure: total_dc_percent {
    label: "총 할인률"
    type: number
    sql: ${es_order_goods.total_dc_2}/${es_order_goods.total_sales_price_2} ;;
    value_format: "0%"
    drill_fields : [detail*]
  }

  measure: avg_sales_price {
    label: "평균 매출(정가)(단위 천원)"
    type: average
    sql: ${fixed_price} ;;
    value_format: "#,##0,"
    filters: {
      field: order_status
      value: "p1,g1,d1,d2,s1,b3,b1,b2,b4,r2,r1,z1,z2,z3,z4,z5,e1,e2,e3,e4,e5"
    }
    filters: {
      field: order_type
      value: "일반"
    }

    drill_fields : [detail*]
  }

  measure: avg_sales_price_c1 {
    label: "평균 매출(단위 천원) A"
    type: average
    sql: ${fixed_price} ;;
    value_format: "#,##0,"
    filters: {
      field: order_status
      value: "p1,g1,d1,d2,s1,b3,b1,b2,b4,r2,r1,z1,z2,z3,z4,z5,e1,e2,e3,e4,e5"
    }
    filters: {
      field: group_a_yesno
      value: "yes"
    }
    filters: {
      field: order_type
      value: "일반"
    }

    drill_fields : [detail*]
  }

  measure: avg_sales_price_c2 {
    label: "평균 매출(단위 천원) B"
    type: average
    sql: ${fixed_price} ;;
    value_format: "#,##0,"
    filters: {
      field: order_status
      value: "p1,g1,d1,d2,s1,b3,b1,b2,b4,r2,r1,z1,z2,z3,z4,z5,e1,e2,e3,e4,e5"
    }
    filters: {
      field: group_b_yesno
      value: "yes"
    }
    filters: {
      field: order_type
      value: "일반"
    }

    drill_fields : [detail*]
  }

  measure: total_payment_price {
    label: "총 순매출(실결제)(단위 천원)"
    type: sum
    sql: ${goods_price}-${enuri}-${member_dc_price}-${division_use_mileage}-${division_coupon_order_dc_price}-${coupon_goods_dc_price} ;;
    value_format: "#,##0,"
    filters: {
      field: order_status
      value: "p1,g1,d1,d2,s1,b3,b1,b2,b4,r2,r1,z1,z2,z3,z4,z5,e1,e2,e3,e4,e5"
    }
    filters: {
      field: order_type
      value: "일반"
    }
    drill_fields : [detail*]
  }
  measure: total_payment_price_2 {
    label: "총 순매출(실결제)(단위 원)"
    type: sum
    sql:${goods_price}-${enuri}-${member_dc_price}-${division_use_mileage}-${division_coupon_order_dc_price}-${coupon_goods_dc_price} ;;
    value_format: "#,##0"
    filters: {
      field: order_status
      value: "p1,g1,d1,d2,s1,b3,b1,b2,b4,r2,r1,z1,z2,z3,z4,z5,e1,e2,e3,e4,e5"
    }
    filters: {
      field: order_type
      value: "일반"
    }

    drill_fields : [detail*]
  }

  measure: total_coupon_dc {
    label: "총 쿠폰 할인 금액(단위 천원)"
    type: sum
    sql: ${division_coupon_order_dc_price}+${coupon_goods_dc_price} ;;
    value_format: "#,##0,"
    filters: {
      field: order_status
      value: "p1,g1,d1,d2,s1,b3,b1,b2,b4,r2,r1,z1,z2,z3,z4,z5,e1,e2,e3,e4,e5"
    }
    filters: {
      field: order_type
      value: "일반"
    }

    drill_fields : [detail*]
  }

  measure: total_coupon_dc_2 {
    label: "총 쿠폰 할인 금액(단위 원)"
    type: sum
    sql: ${division_coupon_order_dc_price}+${coupon_goods_dc_price} ;;
    value_format: "#,##0"
    filters: {
      field: order_status
      value: "p1,g1,d1,d2,s1,b3,b1,b2,b4,r2,r1,z1,z2,z3,z4,z5,e1,e2,e3,e4,e5"
    }
    filters: {
      field: order_type
      value: "일반"
    }

    drill_fields : [detail*]
  }

  measure: total_mileage_dc {
    label: "총 적립금 할인 금액(단위 천원)"
    type: sum
    sql: ${division_use_mileage} ;;
    value_format: "#,##0,"
    filters: {
      field: order_status
      value: "p1,g1,d1,d2,s1,b3,b1,b2,b4,r2,r1,z1,z2,z3,z4,z5,e1,e2,e3,e4,e5"
    }
    filters: {
      field: order_type
      value: "일반"
    }

    drill_fields : [detail*]
  }

  measure: total_mileage_dc_2 {
    label: "총 적립금 할인 금액(단위 원)"
    type: sum
    sql: ${division_use_mileage} ;;
    value_format: "#,##0"
    filters: {
      field: order_status
      value: "p1,g1,d1,d2,s1,b3,b1,b2,b4,r2,r1,z1,z2,z3,z4,z5,e1,e2,e3,e4,e5"
    }
    filters: {
      field: order_type
      value: "일반"
    }

    drill_fields : [detail*]
  }

  measure: total_timesale_dc {
    label: "총 타임세일 금액(단위 천원)"
    type: sum
    sql: ${timesale_dc_price} ;;
    value_format: "#,##0,"
    filters: {
      field: order_status
      value: "p1,g1,d1,d2,s1,b3,b1,b2,b4,r2,r1,z1,z2,z3,z4,z5,e1,e2,e3,e4,e5"
    }
    filters: {
      field: order_type
      value: "일반"
    }

    drill_fields : [detail*]
  }

  measure: total_timesale_dc_2 {
    label: "총 타임세일 금액(단위 원)"
    type: sum
    sql: ${timesale_dc_price} ;;
    value_format: "#,##0"
    filters: {
      field: order_status
      value: "p1,g1,d1,d2,s1,b3,b1,b2,b4,r2,r1,z1,z2,z3,z4,z5,e1,e2,e3,e4,e5"
    }
    filters: {
      field: order_type
      value: "일반"
    }

    drill_fields : [detail*]
  }

  measure: total_member_dc {
    label: "총 회원등급 할인 금액(단위 천원)"
    type: sum
    sql: ${member_dc_price} ;;
    value_format: "#,##0,"
    filters: {
      field: order_status
      value: "p1,g1,d1,d2,s1,b3,b1,b2,b4,r2,r1,z1,z2,z3,z4,z5,e1,e2,e3,e4,e5"
    }
    filters: {
      field: order_type
      value: "일반"
    }

    drill_fields : [detail*]
  }

  measure: total_member_dc_2 {
    label: "총 회원등급 할인 금액(단위 원)"
    type: sum
    sql: ${member_dc_price} ;;
    value_format: "#,##0"
    filters: {
      field: order_status
      value: "p1,g1,d1,d2,s1,b3,b1,b2,b4,r2,r1,z1,z2,z3,z4,z5,e1,e2,e3,e4,e5"
    }
    filters: {
      field: order_type
      value: "일반"
    }

    drill_fields : [detail*]
  }

  measure: total_basic_dc {
    label: "총 기본 할인 금액(단위 천원)"
    type: sum
    sql: ${basic_dc_price} ;;
    value_format: "#,##0,"
    filters: {
      field: order_status
      value: "p1,g1,d1,d2,s1,b3,b1,b2,b4,r2,r1,z1,z2,z3,z4,z5,e1,e2,e3,e4,e5"
    }
    filters: {
      field: order_type
      value: "일반"
    }

    drill_fields : [detail*]
  }

  measure: total_basic_dc_2 {
    label: "총 기본 할인 금액(단위 원)"
    type: sum
    sql: ${basic_dc_price} ;;
    value_format: "#,##0"
    filters: {
      field: order_status
      value: "p1,g1,d1,d2,s1,b3,b1,b2,b4,r2,r1,z1,z2,z3,z4,z5,e1,e2,e3,e4,e5"
    }
    filters: {
      field: order_type
      value: "일반"
    }

    drill_fields : [detail*]
  }

  # measure: total_enuri_dc {
  #   hidden: yes
  #   label: "총 에누리 할인 금액(단위 천원)"
  #   type: sum
  #   sql: ${enuri} ;;
  #   value_format: "#,##0,"
  #   filters: {
  #     field: order_status
  #     value: "p1,g1,d1,d2,s1,b3,b1,b2,b4,r2,r1,z1,z2,z3,z4,z5,e1,e2,e3,e4,e5"
  #   }
  #   filters: {
  #     field: order_type
  #     value: "일반"
  #   }

  #   drill_fields : [detail*]
  # }

  # measure: total_enuri_dc_2 {
  #   hidden: yes
  #   label: "총 에누리 할인 금액(단위 원)"
  #   type: sum
  #   sql: ${enuri} ;;
  #   value_format: "#,##0"
  #   filters: {
  #     field: order_status
  #     value: "p1,g1,d1,d2,s1,b3,b1,b2,b4,r2,r1,z1,z2,z3,z4,z5,e1,e2,e3,e4,e5"
  #   }
  #   filters: {
  #     field: order_type
  #     value: "일반"
  #   }

  #   drill_fields : [detail*]
  # }

  measure: total_goods_dc {
    label: "총 상품 할인 금액(단위 천원)"
    type: sum
    sql: ${goods_dc_price} ;;
    value_format: "#,##0,"
    filters: {
      field: order_status
      value: "p1,g1,d1,d2,s1,b3,b1,b2,b4,r2,r1,z1,z2,z3,z4,z5,e1,e2,e3,e4,e5"
    }
    filters: {
      field: order_type
      value: "일반"
    }

    drill_fields : [detail*]
  }

  measure: avg_goods_dc {
    label: "평균 쿠폰 할인 금액(단위 천원)"
    type: average
    sql: ${division_coupon_order_dc_price}+${coupon_goods_dc_price} ;;
    value_format: "#,##0,"
    filters: {
      field: order_status
      value: "p1,g1,d1,d2,s1,b3,b1,b2,b4,r2,r1,z1,z2,z3,z4,z5,e1,e2,e3,e4,e5"
    }
    filters: {
      field: order_type
      value: "일반"
    }

    drill_fields : [detail*]
  }

  measure: avg_goods_dc_c1 {
    label: "평균 쿠폰 할인 금액(단위 천원) A"
    type: average
    sql: ${division_coupon_order_dc_price}+${coupon_goods_dc_price} ;;
    hidden: yes
    value_format: "#,##0,"
    filters: {
      field: order_status
      value: "p1,g1,d1,d2,s1,b3,b1,b2,b4,r2,r1,z1,z2,z3,z4,z5,e1,e2,e3,e4,e5"
    }
    filters: {
      field: group_a_yesno
      value: "yes"
    }
    filters: {
      field: order_type
      value: "일반"
    }

    drill_fields : [detail*]
  }

  measure: avg_goods_dc_c2 {
    label: "평균 쿠폰 할인 금액(단위 천원) B"
    type: average
    sql: ${division_coupon_order_dc_price}+${coupon_goods_dc_price} ;;
    hidden: yes
    value_format: "#,##0,"
    filters: {
      field: order_status
      value: "p1,g1,d1,d2,s1,b3,b1,b2,b4,r2,r1,z1,z2,z3,z4,z5,e1,e2,e3,e4,e5"
    }
    filters: {
      field: group_b_yesno
      value: "yes"
    }
    filters: {
      field: order_type
      value: "일반"
    }

    drill_fields : [detail*]
  }

  measure: avg_mileage_dc {
    label: "평균 적립금 할인 금액(단위 천원)"
    type: average
    sql: ${division_use_mileage} ;;
    value_format: "#,##0,"
    filters: {
      field: order_status
      value: "p1,g1,d1,d2,s1,b3,b1,b2,b4,r2,r1,z1,z2,z3,z4,z5,e1,e2,e3,e4,e5"
    }
    filters: {
      field: order_type
      value: "일반"
    }

    drill_fields : [detail*]
  }

  measure: avg_mileage_dc_c1 {
    label: "평균 적립금 할인 금액(단위 천원) A"
    hidden: yes
    type: average
    sql: ${division_use_mileage} ;;
    value_format: "#,##0,"
    filters: {
      field: order_status
      value: "p1,g1,d1,d2,s1,b3,b1,b2,b4,r2,r1,z1,z2,z3,z4,z5,e1,e2,e3,e4,e5"
    }
    filters: {
      field: group_a_yesno
      value: "yes"
    }
    filters: {
      field: order_type
      value: "일반"
    }

    drill_fields : [detail*]
  }

  measure: avg_mileage_dc_c2 {
    label: "평균 적립금 할인 금액(단위 천원) B"
    hidden: yes
    type: average
    sql: ${division_use_mileage} ;;
    value_format: "#,##0,"
    filters: {
      field: order_status
      value: "p1,g1,d1,d2,s1,b3,b1,b2,b4,r2,r1,z1,z2,z3,z4,z5,e1,e2,e3,e4,e5"
    }
    filters: {
      field: group_b_yesno
      value: "yes"
    }
    filters: {
      field: order_type
      value: "일반"
    }

    drill_fields : [detail*]
  }

  measure: total_dc {
    label: "총 할인 금액(단위 천원)"
    type: sum
    sql: ${enuri}+${timesale_dc_price}+${member_dc_price}+${division_use_mileage}+${division_coupon_order_dc_price}+${coupon_goods_dc_price}+${basic_dc_price} ;;
    value_format: "#,##0,"
    filters: {
      field: order_status
      value: "p1,g1,d1,d2,s1,b3,b1,b2,b4,r2,r1,z1,z2,z3,z4,z5,e1,e2,e3,e4,e5"
    }
    filters: {
      field: order_type
      value: "일반"
    }
    drill_fields : [detail*]
  }

  measure: total_dc_2 {
    label: "총 할인 금액(단위 원)"
    type: sum
    sql: ${enuri}+${timesale_dc_price}+${member_dc_price}+${division_use_mileage}+${division_coupon_order_dc_price}+${coupon_goods_dc_price}+${basic_dc_price} ;;
    value_format: "#,##0"
    filters: {
      field: order_status
      value: "p1,g1,d1,d2,s1,b3,b1,b2,b4,r2,r1,z1,z2,z3,z4,z5,e1,e2,e3,e4,e5"
    }
    filters: {
      field: order_type
      value: "일반"
    }
    drill_fields : [detail*]
  }

  measure: total_goods_nm {
    label: "총 상품 수"
    type: count_distinct
    sql: ${goods_nm} ;;
    filters: {
      field: order_status
      value: "p1,g1,d1,d2,s1,b3,b1,b2,b4,r1,r2,r3,z1,z2,z3,z4,z5,e1,e2,e3,e4,e5"
    }
    filters: {
      field: order_type
      value: "일반"
    }
  }

  set: detail {
    fields: [date, sno, order_no,goods_brand,goods_nm,size,es_member.mem_id,es_member.age_tier,es_member.sex_fl,order_status, fixed_price,goods_price,basic_dc_price, total_coupon_dc_2, division_use_mileage,time_sale_fl,member_dc_price,enuri,total_dc_2,total_payment_price_2,total_dc_percent  ]
  }

  # dimension: cost_price {
  #   hidden: yes
  #   label: "매입가"
  #   type: number
  #   sql: ${TABLE}.costPrice ;;
  # }

  dimension: option_info {
    group_label: "상품 정보"
    hidden: no
    type: string
    sql: ${TABLE}.optionInfo ;;
  }

  dimension: option_sno {
    hidden: yes
    type: number
    sql: ${TABLE}.optionSno ;;
  }

  dimension: purchase_no {
    hidden: yes
    type: number
    sql: ${TABLE}.purchaseNo ;;
  }

  dimension: minus_deposit_fl {
    hidden: yes
    label: "마일리지 차감 여부"
    type: string
    sql: ${TABLE}.minusDepositFl ;;
  }

  dimension: minus_mileage_fl {
    hidden: yes
    label: "사용 마일리지 차감 여부"
    type: string
    sql: ${TABLE}.minusMileageFl ;;
  }

  dimension: minus_restore_deposit_fl {
    hidden: yes
    label: "복원 여부 (적립 적립금)"
    type: string
    sql: ${TABLE}.minusRestoreDepositFl ;;
  }

  dimension: minus_restore_mileage_fl {
    hidden: yes
    label: "사용 마일리지 복원 여부"
    type: string
    sql: ${TABLE}.minusRestoreMileageFl ;;
  }

  dimension: minus_restore_stock_fl {
    hidden: yes
    label: "복원 여부 (재고)"
    type: string
    sql: ${TABLE}.minusRestoreStockFl ;;
  }

  dimension: minus_stock_fl {
    hidden: yes
    label: "차감 여부 (재고)"
    type: string
    sql: ${TABLE}.minusStockFl ;;
  }

  dimension: send_sms_fl {
    hidden: yes
    label: "문자발송여부"
    type: string
    sql: ${TABLE}.sendSmsFl ;;
  }
}
