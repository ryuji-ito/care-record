# README

## users
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, unique: true|
|pass|string|null: false|

### Association
- has_many :residents
- has_many :floors
- has_many :records

## floors
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|resident|string|
|user_id|integer|null: false|

### Association
- belongs_to :user
- has_many :residents

## residents
|Column|Type|Options|
|------|----|-------|
|name|string|
|floor_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :floor
- has_many :records
- belongs_to :user

## records
|Column|Type|Options|
|------|----|-------|
|resident_id|integer|null: false, foreign_key: true|
|text|text|
|image|text|
|writer_name|string|null: false|

### Association
- belongs_to :resident
- belongs_to :user

## Floor_residents
|Column|Type|Options|
|------|----|-------|
|floor_id|integer|null: false, foreign_key: true|
|resident_id|integer|null :false, foreign_key: true|

### Association
- belongs_to :floor
- belongs_to :resident