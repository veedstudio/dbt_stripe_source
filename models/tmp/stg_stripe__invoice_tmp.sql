{{ config(enabled=var('stripe__using_invoices', True)) }}

select * from (

{{
    fivetran_utils.union_data(
        table_identifier='stripe_invoice_line_item_identifier', 
        database_variable='stripe_database', 
        schema_variable='stripe_schema', 
        default_database=target.database,
        default_schema='stripe',
        default_variable='invoice',
        union_schema_variable='stripe_union_schemas',
        union_database_variable='stripe_union_databases'
    )
}}

) as fields

{{ livemode_predicate() }}
