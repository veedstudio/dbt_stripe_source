{{ config(enabled=var('stripe__using_subscriptions', True)) }}

select * from (

{% if var('stripe__using_price', does_table_exist('price')) %}

{{
    fivetran_utils.union_data(
        table_identifier='price', 
        database_variable='stripe_database', 
        schema_variable='stripe_schema', 
        default_database=target.database,
        default_schema='stripe',
        default_variable='price',
        union_schema_variable='stripe_union_schemas',
        union_database_variable='stripe_union_databases'
    )

}}

{% else %}

{{
    fivetran_utils.union_data(
        table_identifier='plan', 
        database_variable='stripe_database', 
        schema_variable='stripe_schema', 
        default_database=target.database,
        default_schema='stripe',
        default_variable='plan',
        union_schema_variable='stripe_union_schemas',
        union_database_variable='stripe_union_databases'
    )

}}

{% endif %}

) as fields
{{ livemode_predicate() }}