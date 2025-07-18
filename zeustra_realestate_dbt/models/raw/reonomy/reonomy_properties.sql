
{{ config(materialized='table') }}
with relevant_columns AS
(
  SELECT
  record->>'property_id' as reonomy_id,
  record->>'address_line1' AS address,
  jsonb_array_elements_text(record->'parcel_shape_ids')AS parcel_number,
  record->>'block_id' AS block_id,
  record->>'census_tract' as census_tract,
  record->>'lot_size_depth_feet' AS depth,
  record->>'floors' AS floors,
  record->>'lot_size_frontage_feet' AS frontage,
  record->>'lot_size_acres' AS area_acres,
  record->>'lot_size_sqft' AS area_sqft,
  record->'sales' as sales_info,
  (record->'location')->>'lat' AS latitude,
  (record->'location')->>'lon' AS longitude,
  record->>'legal_description' AS legal_description,
  record->>'mcd_name' AS mcd_name,
  record->>'msa_name' AS msa_name,
  record->>'neighborhood_name' AS neighborhood_name,
  record->>'sum_buildings_nbr' AS number_of_buildings,
  record->>'floors' AS number_of_floors,
  record->>'total_units' AS number_of_units,
  id as original_source_id,
  record->>'reported_owner_address_line1' AS owner_address,
  record->>'asset_category' AS property_type,
  record->>'asset_type' AS property_subtype,
  record->>'apn' AS apn,
  record->>'fips_county'AS county,
  record->>'city' AS city,
  record->>'state' AS "state",
  record->>'street' AS street,
  record->>'zip5' AS zip,
  record->'tenants'AS occupant_tenants,
  record->'sales' AS property_sales,
  record->'mortgages' AS mortgages,
  record->>'master_update_time' AS last_update_time,
  record->>'year_built' AS year_built,
  record->>'year_renovated' AS year_renovated,
  record->>'sum_building_sqft' AS sum_building_sqft,
  record->>'building_area' AS building_area_sqft,
  record->>'residential_units' AS residential_units 
FROM  {{source('raw_data','reonomy_properties_api')}}
)
SELECT * FROM relevant_columns 
  















