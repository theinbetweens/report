#'Name', 'Sku', 'Description', 'Supplier', 'Price', 'Unit Cost', 'Number Sold', 'Total', '(Currency)', 'Method Taken', 'Backend Only', 'In Catalogue', 'Discontinued', 'Web Only'
require 'csv'
# TODO table should be association

columns = [
  {label: 'Name', accessor: 'name', table: 'product', format: 'text'},
  {label: 'Sku', accessor: 'sku', table: 'variants', format: 'text'},
  {label: 'Description', accessor: 'internal_description', table: 'variants', format: 'text'},
  {label: 'Supplier', accessor: 'name', table: 'supplier', format: 'text'},
  {label: 'Price', accessor: 'price_gbp', table: 'variants', format: 'money'},
  {label: 'RRP', accessor: 'price_gbp_rrp', table: 'variants', format: 'money'},
  {label: 'Backend Only', accessor: 'backend_only_flag', table: 'product', format: 'boolean'},
  {label: 'In Catalogue', accessor: 'in_catalogue_flag', table: 'product', format: 'boolean'},
  {label: 'Discontinued', accessor: 'discontinued_flag', table: 'product', format: 'boolean'},
  {label: 'Web Only', accessor: 'web_only_flag', table: 'product', format: 'boolean'}
]

def row(model, columns)
  columns.collect do |column|
    if column[:table] == 'variants'
      next display(model.send(column[:accessor].to_sym), column[:format] )
    end
    display( model.send(column[:table]).send(column[:accessor]), column[:format] )
  end
end

def display(value, format)
  if format == 'money'
    return "%.2f" % (value/100.0)
  end
  return value
end

res = []
CSV.open("variant_information.csv", "wb") do |csv|
  csv << columns.collect {|x| x[:label] }

  Variant.where(archived: false).joins(:product, :supplier).where(:products => {state: 'published'}).each do |variant|
    res << row(variant,columns)
    csv << row(variant,columns)
  end  
end
              # row['name'],
              # row['sku'],
              # row['internal_description'],
              # row['supplier_name'],
              # csv_money_with_currency(Money.new(row['currency'], row['unit_price_inc_vat'].to_i)),
              # csv_money_with_currency(Money.new(row['price_cost_currency'], row['cost'].to_i)),
              # row['quantity'],
              # csv_money_with_currency(Money.new(row['currency'], row['total_price'].to_i)),
              # row['currency'],
              # Order.method_taken_name(row['method_taken'].to_i),
              # row['backend_only'],
              # row['in_catalogue'],
              # row['discontinued'],
              # row['web_only']