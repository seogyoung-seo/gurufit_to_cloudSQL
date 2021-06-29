view: es_member {
  sql_table_name: gurufit_to_looker.es_member ;;

#############################################################################주소관련

  dimension: address {
    group_label: "주소"
    label: "주소"
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: add1 {
    group_label: "주소"
    label: "시도"
    type: string
    sql:SUBSTRING_INDEX(${address}, ' ', 1)  ;;
    drill_fields: [add2]
  }

  dimension: add2 {
    group_label: "주소"
    label: "시군구"
    type: string
    sql:SUBSTRING_INDEX(${address}, ' ', 2)  ;;
    drill_fields: [add1]
  }

  dimension: add_tier {
    group_label: "주소"
    label: "서울/경기도/인천/부산/기타/알수없음"
    type: string
    sql: case
        when SUBSTRING_INDEX(${address}, ' ', 1)='경기도' then '2경기도'
        when SUBSTRING_INDEX(${address}, ' ', 1)='서울특별시' then '1서울특별시'
        when SUBSTRING_INDEX(${address}, ' ', 1)='부산광역시' then '4부산광역시'
        when SUBSTRING_INDEX(${address}, ' ', 1)='인천광역시' then '3인천광역시'
        when SUBSTRING_INDEX(${address}, ' ', 1)='' or SUBSTRING_INDEX(${address}, ' ', 1) is null then '6알 수 없음'
        else '5기타 지역' end ;;
    drill_fields: [add1]
  }


  dimension: address_sub {
    group_label: "주소"
    label: "상세주소"
    type: string
    sql: ${TABLE}.addressSub ;;
  }

  dimension: zipcode {
    group_label: "주소"
    label: "우편번호"
    type: zipcode
    sql: ${TABLE}.zipcode ;;
  }

  dimension: zonecode {
    group_label: "주소"
    label: "우편번호(5자리)"
    type: string
    sql: ${TABLE}.zonecode ;;
  }

  dimension_group: birth_dt {
    label: "생년월일"
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
    sql: ${TABLE}.birthDt ;;
  }


  dimension_group: entry_dt {
    label: "가입일"
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
    sql: ${TABLE}.entryDt ;;
  }

  dimension_group: last_login_dt {
    label: "최종로그인"
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
    sql: ${TABLE}.lastLoginDt ;;
  }

  dimension_group: last_sale_dt {
    label: "최종구매일"
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
    sql: ${TABLE}.lastSaleDt ;;
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
      year
    ]
    sql: ${TABLE}.regDt ;;
  }


############################################################################# 개인정보
  dimension: mem_no {
    group_label: "개인정보"
    label: "회원번호"
    primary_key: yes
    type: number
    sql: ${TABLE}.memNo ;;
  }

  dimension: mem_pw {
    group_label: "개인정보"
    label: "비밀번호"
    type: string
    sql: ${TABLE}.memPw ;;
  }

  dimension: nick_nm {
    group_label: "개인정보"
    label: "닉네임"
    type: string
    sql: ${TABLE}.nickNm ;;
  }

  dimension: mem_id {
    group_label: "개인정보"
    label: "아이디"
    type: string
    sql: ${TABLE}.memId ;;
  }

  dimension: mem_nm {
    group_label: "개인정보"
    label: "이름"
    type: string
    sql: ${TABLE}.memNm ;;
  }

  dimension: cell_phone {
    group_label: "개인정보"
    label: "핸드폰"
    type: string
    sql: ${TABLE}.cellPhone ;;
  }

  dimension: email {
    group_label: "개인정보"
    label: "이메일"
    type: string
    sql: ${TABLE}.email ;;
  }


  dimension: phone {
    group_label: "개인정보"
    label: "전화번호"
    type: string
    sql: ${TABLE}.phone ;;
  }
  dimension: sex_fl {
    group_label: "개인정보"
    label: "성별"
    type: string
    sql: case
        when ${TABLE}.sexFl='m' then '1남성'
        when ${TABLE}.sexFl='w' then '2여성'
        else '9알 수 없음' end ;;
    }

    dimension: age {
      group_label: "개인정보"
      label: "나이"
      type: number
      sql: substring(now(),1,4)-substring(${birth_dt_date},1,4)+1 ;;
    }

    dimension: entry_path {
      group_label: "개인정보"
      label: "가입경로"
      type: string
      sql: ${TABLE}.entryPath ;;
    }


    dimension: group_sno {
      group_label: "개인정보"
      label: "회원등급sno"
      type: number
      sql: ${TABLE}.groupSno ;;
    }

    dimension: rncheck {
      group_label: "개인정보"
      label: "본인확인방법"
      type: string
      sql: ${TABLE}.rncheck ;;
    }

#############################################################################추천인
    dimension: recomm_fl {
      group_label: "추천인"
      label: "추천인등록여부"
      type: string
      sql: ${TABLE}.recommFl ;;
    }

    dimension: recomm_id {
      group_label: "추천인"
      label: "추천인id"
      type: string
      sql: ${TABLE}.recommId ;;
    }

#############################################################################로그인 관련 정보
    dimension: login_cnt {
      group_label: "로그인 관련 정보"
      label: "로그인횟수"
      type: number
      sql: ${TABLE}.loginCnt ;;
    }

    dimension: login_limit {
      group_label: "로그인 관련 정보"
      label: "로그인제한"
      type: string
      sql: ${TABLE}.loginLimit ;;
    }

    dimension: last_login_ip {
      group_label: "로그인 관련 정보"
      label: "최종로그인IP"
      type: string
      sql: ${TABLE}.lastLoginIp ;;
    }

############################################################################# 구매관련 정보
    dimension: mileage {
      group_label: "구매 관련 정보"
      label: "적립금"
      type: number
      sql: ${TABLE}.mileage ;;
    }

    dimension: sale_amt {
      group_label: "구매 관련 정보"
      label: "총구매금액"
      type: number
      sql: ${TABLE}.saleAmt ;;
    }

    dimension: sale_cnt {
      group_label: "구매 관련 정보"
      label: "구매횟수"
      type: number
      sql: ${TABLE}.saleCnt ;;
    }
    dimension: deposit {
      group_label: "구매 관련 정보"
      label: "예치금"
      type: number
      sql: ${TABLE}.deposit ;;
    }

    dimension: sale_yn{
      group_label: "구매 관련 정보"
      label: "구매여부(구매확정건만)"
      type: yesno
      sql: ${sale_cnt} >= '1' ;;
    }

    dimension: first_order {
      group_label: "구매 관련 정보"
      label: "첫 구매까지 걸린 시간"
      type: string
      sql: DATEDIFF(${es_order_goods.payment_dt_date},${reg_dt_date}) ;;
    }


#############################################################################yesno
    dimension: mailling_fl {
      group_label: "yesno"
      label: "메일수신여부"
      type: string
      sql: ${TABLE}.maillingFl ;;
    }

    dimension: sleep_fl {
      group_label: "yesno"
      label: "휴면회원여부"
      type: string
      sql: ${TABLE}.sleepFl ;;
    }

    dimension: sleep_mail_fl {
      group_label: "yesno"
      label: "휴면전환안내메일발송여부"
      type: string
      sql: ${TABLE}.sleepMailFl ;;
    }

    dimension: sleep_sms_fl {
      group_label: "yesno"
      label: "휴면전환안내SMS발송여부"
      type: string
      sql: ${TABLE}.sleepSmsFl ;;
    }

    dimension: sms_fl {
      group_label: "yesno"
      label: "SMS수신여부"
      type: string
      sql: ${TABLE}.smsFl ;;
    }

############################################################################# tier

    dimension: age_tier {
      group_label: "그룹"
      type: string
      sql: case
          when 10<=(substring(now(),1,4)-substring(${birth_dt_date},1,4)+1) and (substring(now(),1,4)-substring(${birth_dt_date},1,4)+1) <20 then '10대'
          when 20<=(substring(now(),1,4)-substring(${birth_dt_date},1,4)+1) and (substring(now(),1,4)-substring(${birth_dt_date},1,4)+1) <30 then '20대'
          when 30<=(substring(now(),1,4)-substring(${birth_dt_date},1,4)+1) and (substring(now(),1,4)-substring(${birth_dt_date},1,4)+1) <40 then '30대'
          when 40<=(substring(now(),1,4)-substring(${birth_dt_date},1,4)+1) and (substring(now(),1,4)-substring(${birth_dt_date},1,4)+1) <50 then '40대'
          when 50<=(substring(now(),1,4)-substring(${birth_dt_date},1,4)+1) and (substring(now(),1,4)-substring(${birth_dt_date},1,4)+1) <60 then '50대'
          when 60<=(substring(now(),1,4)-substring(${birth_dt_date},1,4)+1) and (substring(now(),1,4)-substring(${birth_dt_date},1,4)+1) <80 then '60대 이상'
          else '9알 수 없음' end ;;
      drill_fields: [age]
    }

    dimension: last_sale_tier {
      group_label: "그룹"
      type: string
      sql: case when 0<=DATEDIFF(now(),ifnull(${last_sale_dt_date},0)) and DATEDIFF(now(),ifnull(${last_sale_dt_date},0))<=7 then '1.7일 이내'
            when 8<=DATEDIFF(now(),ifnull(${last_sale_dt_date},0)) and DATEDIFF(now(),ifnull(${last_sale_dt_date},0))<=30 then '2.30일 이내'
            when 31<=DATEDIFF(now(),ifnull(${last_sale_dt_date},0)) and DATEDIFF(now(),ifnull(${last_sale_dt_date},0))<=60 then '3.60일 이내'
            when 61<=DATEDIFF(now(),ifnull(${last_sale_dt_date},0)) and DATEDIFF(now(),ifnull(${last_sale_dt_date},0))<=90 then '4.90일 이내'
            when ifnull(${last_sale_dt_date},0)='0' then '6.구매 이력 없음'
            else '5.90일 이후' end ;;
    }

    dimension: last_login_tier {
      group_label: "그룹"
      type: string
      sql: case when 0<=DATEDIFF(now(),ifnull(${last_login_dt_date},0)) and DATEDIFF(now(),ifnull(${last_login_dt_date},0))<=7 then '1.7일 이내'
            when 8<=DATEDIFF(now(),ifnull(${last_login_dt_date},0)) and DATEDIFF(now(),ifnull(${last_login_dt_date},0))<=30 then '2.30일 이내'
            when 31<=DATEDIFF(now(),ifnull(${last_login_dt_date},0)) and DATEDIFF(now(),ifnull(${last_login_dt_date},0))<=60 then '3.60일 이내'
            when 61<=DATEDIFF(now(),ifnull(${last_login_dt_date},0)) and DATEDIFF(now(),ifnull(${last_login_dt_date},0))<=90 then '4.90일 이내'
            when ifnull(${last_login_dt_date},0)='0' then '6.로그인 이력 없음'
            else '5.90일 이후' end ;;
    }

    dimension: sale_count_tier {
      group_label: "그룹"
      type: string
      sql: case when ${sale_cnt}=0 then '0회'
          when ${sale_cnt}=1 then '1회'
          when ${sale_cnt}=2 then '2회'
          when ${sale_cnt}=3 then '3회'
          when ${sale_cnt}=4 then '4회'
          else '5회 이상' end ;;
    }

#############################################################################미분류

    filter: timeframe_a {
      type: date_time
    }

    dimension: group_a_yesno {
      hidden: yes
      type: yesno
      sql: {% condition timeframe_a %} ${reg_dt_raw} {% endcondition %} ;;
    }

    filter: timeframe_b {
      type: date_time
    }

    dimension: group_b_yesno {
      hidden: yes
      type: yesno
      sql: {% condition timeframe_b %} ${reg_dt_raw} {% endcondition %} ;;
    }

############################################################################# measure

    measure: mem_count {
      label: "총 회원 수"
      type: count
      drill_fields: [detail*]
    }

    measure: mem_count_c1 {
      label: "총 회원 수 비교1"
      type: count
      filters: {
        field: group_a_yesno
        value: "yes"
      }
      drill_fields: [detail*]
    }

    measure: mem_count_c2 {
      label: "총 회원 수 비교2"
      type: count
      filters: {
        field: group_b_yesno
        value: "yes"
      }

      drill_fields: [detail*]
    }

    measure: mem_distinct_count {
      label: "총 회원 수(distinct)"
      type: count_distinct
      sql: ${mem_no} ;;
      drill_fields: [detail*]
    }

    measure: sale_mem_count {
      label: "총 유료 회원 수"
      type: count_distinct
      sql: ${mem_no} ;;
      filters: {
        field: es_order_goods.order_status
        value: "p1,g1,d1,d2,s1,b3,b1,b2,b4,r2,r1,z1,z2,z3,z4,z5,e1,e2,e3,e4,e5"
      }
      drill_fields: [detail*]
    }

    measure: sleep_mem_count {
      label: "총 휴면 회원 수"
      type: count_distinct
      sql: ${mem_no} ;;
      filters: {
        field: sleep_fl
        value: "y"
      }
      drill_fields: [detail*]
    }

    measure: sale_mem_count_c1 {
      label: "총 유료 회원 수 비교1"
      type: count_distinct
      sql: ${mem_no} ;;
      filters: {
        field: es_order_goods.order_status
        value: "p1,g1,d1,d2,s1,b3,b1,b2,b4,r2,r1,z1,z2,z3,z4,z5,e1,e2,e3,e4,e5"
      }
      filters: {
        field: group_a_yesno
        value: "yes"
      }
      drill_fields: [detail*]
    }

    measure: sale_mem_count_c2 {
      label: "총 유료 회원 수 비교2"
      type: count_distinct
      sql: ${mem_no} ;;
      filters: {
        field: es_order_goods.order_status
        value: "p1,g1,d1,d2,s1,b3,b1,b2,b4,r2,r1,z1,z2,z3,z4,z5,e1,e2,e3,e4,e5"
      }
      filters: {
        field: group_b_yesno
        value: "yes"
      }
      drill_fields: [detail*]
    }

    measure: sale_count {
      label: "평균 구매 횟수"
      type: sum
      sql: ${sale_cnt} ;;
    }

    measure: sales_per_mem {
      label: "회원 당 매출"
      type: number
      value_format: "#,##0"
      sql: ${es_order_goods.total_sales_price}/${es_member.mem_distinct_count} ;;
    }

    measure: login_per_mem {
      label: "회원 당 로그인 수"
      type: number
      value_format: "#,##0.0"
      sql: ${es_member_login_log.total_login}/${es_member.mem_distinct_count} ;;
    }

    measure: goods_per_mem {
      label: "회원 당 구매족수"
      type: number
      value_format: "#,##0.0"
      sql: ${es_order_goods.goods_count}/${es_member.mem_distinct_count} ;;
    }

    measure: sales_per_goods {
      label: "상품 당 매출"
      type: number
      value_format: "#,##0"
      sql: ${es_order_goods.total_sales_price}/${es_order_goods.goods_count} ;;
    }

    set: detail{
      fields: [es_order_goods.date,mem_no,mem_id,mem_nm,cell_phone,age_tier, sex_fl,sale_cnt,sale_amt,es_order.first_sale_fl,reg_dt_date]
    }

    dimension: com_address {
      hidden: yes
      label: "사업장주소"
      type: string
      sql: ${TABLE}.comAddress ;;
    }

    dimension: com_address_sub {
      hidden: yes
      label: "사업장상세주소"
      type: string
      sql: ${TABLE}.comAddressSub ;;
    }

    dimension: com_zipcode {
      hidden: yes
      label: "사업장우편번호"
      type: string
      sql: ${TABLE}.comZipcode ;;
    }

    dimension: com_zonecode {
      hidden: yes
      label: "사업장 우편번호(5자리)"
      type: string
      sql: ${TABLE}.comZonecode ;;
    }

    dimension: company {
      hidden: yes
      label: "회사명"
      type: string
      sql: ${TABLE}.company ;;
    }

    dimension: ex1 {
      hidden: yes
      type: string
      sql: ${TABLE}.ex1 ;;
    }

    dimension: ex2 {
      hidden: yes
      type: string
      sql: ${TABLE}.ex2 ;;
    }

    dimension: ex3 {
      hidden: yes
      type: string
      sql: ${TABLE}.ex3 ;;
    }

    dimension: ex4 {
      hidden: yes
      type: string
      sql: ${TABLE}.ex4 ;;
    }

    dimension: ex5 {
      hidden: yes
      type: string
      sql: ${TABLE}.ex5 ;;
    }

    dimension: ex6 {
      hidden: yes
      type: string
      sql: ${TABLE}.ex6 ;;
    }


    dimension: admin_memo {
      hidden: yes
      label: "관리자 메모"
      type: string
      sql: ${TABLE}.adminMemo ;;
    }

    dimension_group: adult_confirm_dt {
      hidden: yes
      label: "성인여부인증시간"
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
      sql: ${TABLE}.adultConfirmDt ;;
    }

    dimension: adult_fl {
      hidden: yes
      label: "성인여부"
      type: string
      sql: ${TABLE}.adultFl ;;
    }

    dimension: app_fl {
      hidden: yes
      label: "승인여부"
      type: string
      sql: ${TABLE}.appFl ;;
    }

    dimension_group: group_mod_dt {
      hidden: no
      label: "등급수정일"
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
      sql: ${TABLE}.groupModDt ;;
    }

    dimension_group: group_valid_dt {
      hidden: yes
      label: "등급유효일"
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
      sql: ${TABLE}.groupValidDt ;;
    }

    dimension_group: guide_password_dt {
      hidden: yes
      label: "비밀번호변경안내일"
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
      sql: ${TABLE}.guidePasswordDt ;;
    }


    dimension_group: approval_dt {
      hidden: yes
      label: "가입 승인 일"
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
      sql: ${TABLE}.approvalDt ;;
    }
    dimension_group: birth_event_fl {
      hidden: yes
      label: "생일 이벤트 여부 - sms,쿠폰 등 처리일자"
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
      sql: ${TABLE}.birthEventFl ;;
    }


    dimension_group: change_password_dt {
      hidden: yes
      label: "비밀번호변경일"
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
      sql: ${TABLE}.changePasswordDt ;;
    }

    dimension_group: entry_benefit_offer_dt {
      hidden: yes
      label: "가입혜택지급일"
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
      sql: ${TABLE}.entryBenefitOfferDt ;;
    }

    dimension_group: mod_dt {
      hidden: yes
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

    dimension: busi_no {
      hidden: yes
      label: "사업자 번호"
      type: string
      sql: ${TABLE}.busiNo ;;
    }

    dimension: calendar_fl {
      hidden: yes
      label: "양력,음력"
      type: string
      sql: ${TABLE}.calendarFl ;;
    }


    dimension: cell_phone_country_code {
      hidden: yes
      type: string
      sql: ${TABLE}.cellPhoneCountryCode ;;
    }

    dimension: ceo {
      hidden: yes
      label: "대표자"
      type: string
      sql: ${TABLE}.ceo ;;
    }

    dimension: dupeinfo {
      hidden: yes
      label: "중복가입확인정보"
      type: string
      sql: ${TABLE}.dupeinfo ;;
    }

    dimension_group: marri {
      hidden: yes
      label: "결혼기념일"
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
      sql: ${TABLE}.marriDate ;;
    }

    dimension: marri_fl {
      hidden: yes
      label: "결혼여부"
      type: string
      sql: ${TABLE}.marriFl ;;
    }

    dimension: job {
      hidden: yes
      label: "직업"
      type: string
      sql: ${TABLE}.job ;;
    }

    dimension: expiration_fl {
      hidden: yes
      label: "개인정보유효기간"
      type: string
      sql: ${TABLE}.expirationFl ;;
    }

    dimension: fax {
      hidden: yes
      type: string
      sql: ${TABLE}.fax ;;
    }
    dimension: foreigner {
      hidden: yes
      type: string
      sql: ${TABLE}.foreigner ;;
    }


    dimension: interest {
      hidden: yes
      label: "관심분야"
      type: string
      sql: ${TABLE}.interest ;;
    }

    dimension: item {
      hidden: yes
      label: "종목"
      type: string
      sql: ${TABLE}.item ;;
    }

    dimension: mall_sno {
      hidden: yes
      type: number
      sql: ${TABLE}.mallSno ;;
    }


    dimension: member_fl {
      hidden: yes
      label: "회원구분"
      type: string
      sql: ${TABLE}.memberFl ;;
    }

    dimension: memo {
      hidden: yes
      label: "남기는말"
      type: string
      sql: ${TABLE}.memo ;;
    }

    dimension: pakey {
      hidden: yes
      label: "가상번호"
      type: string
      sql: ${TABLE}.pakey ;;
    }

    # dimension: re_entry_fl {
    #   hidden: yes
    #   label: "재가입여부"
    #   type: string
    #   sql: ${TABLE}.reEntryFl ;;
    # }

    # dimension: service {
    #   hidden: yes
    #   label: "업태"
    #   type: string
    #   sql: ${TABLE}.service ;;
    # }
  }