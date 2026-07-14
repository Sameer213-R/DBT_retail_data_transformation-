# Databricks notebook source
# MAGIC %md
# MAGIC # Bronze data layer
# MAGIC

# COMMAND ----------

def load_bronze(
    source_path,
    schema_path,
    checkpoint_path,
    table_name
):

    (
        spark.readStream
        .format("cloudFiles")
        .option("cloudFiles.format", "csv")
        .option("header", "true")
        .option("cloudFiles.inferColumnTypes", "true")
        .option("cloudFiles.schemaLocation", schema_path)
        .load(source_path)

        .writeStream
        .option("checkpointLocation", checkpoint_path)
        .trigger(availableNow=True)
        .toTable(table_name)
    )
    

# COMMAND ----------

files_name = ['customers','orders','categories','inventory','order_items','payments','products','stores','suppliers']

# COMMAND ----------

# run the function
for file in files_name:
    load_bronze(
    source_path=f"s3://aws-s3-data-store/incoming/{file}/",
    schema_path=f"s3://aws-s3-data-store/schema/{file}/",
    checkpoint_path=f"s3://aws-s3-data-store/checkpoints/{file}/",
    table_name=f"retail_store_catlog.bronze.{file}_bronze"
)


# COMMAND ----------

# # create for orders
# load_bronze(
#     source_path="s3://aws-s3-data-store/incoming/orders/",
#     schema_path="s3://aws-s3-data-store/schema/orders/",
#     checkpoint_path="s3://aws-s3-data-store/checkpoints/orders/",
#     table_name="retail_store_catlog.bronze.orders_bronze"
# )