ThisBuild / version := "0.1.0-SNAPSHOT"
ThisBuild / scalaVersion := "2.13.12"
ThisBuild / organization := "com.example"

val toolkitTest = "org.scala-lang" %% "toolkit-test" % "0.1.7"

lazy val root = (project in file("."))
  .enablePlugins(JavaAppPackaging)
  .aggregate(core)
  .dependsOn(core)
  .settings(
    name := "ardent-satyr",
    libraryDependencies += toolkitTest % Test,
    maintainer := "SBT Dev",
    assembly / mainClass := Some("example.Hello")
  )

lazy val core = (project in file("core"))
  .settings(
    name := "core",
    libraryDependencies ++= Seq(
      "org.scala-lang" %% "toolkit" % "0.1.7",
      toolkitTest % Test
    )
  )