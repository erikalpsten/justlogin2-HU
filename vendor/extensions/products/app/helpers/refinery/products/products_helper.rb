module Refinery
  module Products
    module ProductsHelper

      def group_product_feature(products)
        sql_query = <<-eos
          SELECT "rp"."id" as id, "rppf"."name" as feature_name, "rppfp"."value" as value, "fg"."name" as group_name
          FROM "refinery_products" as "rp" 
             INNER JOIN "refinery_products_product_features_products" as "rppfp" 
                ON "rppfp"."product_id" = "rp"."id" AND "rp"."id" = ?                
             RIGHT JOIN "refinery_products_product_features" as "rppf" 
                ON "rppfp"."product_feature_id" = "rppf"."id"
             LEFT JOIN "refinery_products_feature_groups" as fg 
                ON "fg"."id" = "rppf"."feature_group_id"
          ORDER BY "rppf"."position"
        eos
        # load product features
        product_with_features = {}
        products.each do |product|
          Refinery::Products::Product.find_by_sql([sql_query, product.id]).each do |feature|
            product_with_features[feature['group_name']] ||= {}
            product_with_features[feature['group_name']][feature['feature_name']] ||= []
            product_with_features[feature['group_name']][feature['feature_name']].push(feature['value'])
          end
        end
        product_with_features
      end
    end
  end
end