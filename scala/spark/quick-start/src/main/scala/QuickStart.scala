import org.apache.spark.sql.SparkSession

object QuickStart {
  def main(args: Array[String]): Unit = {
    val logFile = if (args.length > 0) args(0) else "../../../README.md"
    val spark = SparkSession.builder.appName("Quick Start").getOrCreate()
    val logData = spark.read.textFile(logFile).cache()
    val numAs = logData.filter(line => line.contains("a")).count()
    val numBs = logData.filter(line => line.contains("b")).count()
    println(s"Lines with a: $numAs, Lines with b: $numBs")
    spark.stop()
  }
}
