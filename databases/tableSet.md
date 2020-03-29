@startuml
package shopping_supporter {
	package item{
		entity item_master {
			item_id
			type_id
			item_name
		}
		note right:商品固有情報管理

		entity item_type {
			type_id
			type_name
		}
		note right:商品種別（食品・洗剤など）

		entity item_purchase {
			item_id
			count
		}
		note right:一度に購入する個数の管理

		entity item_possession {
			item_id
			number_possession
		}
		note right:現在の保有数の管理

		item_master <-up- item_purchase
		item_master <-up- item_possession
		item_master -up-> item_type
	}

	package coupon {
		entity coupon_type {
			type_id
			type_name
			description
		}
		note right:クーポンの種別

		entity coupon_info {
			coupon_id
			type_id
			date_begin
			date_end
			params...
		}
		note right:クーポン1枚の情報
		coupon -up-> coupon_type
	}
}
@enduml