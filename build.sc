import mill._, scalalib._

object core extends ScalaModule {
  def scalaVersion = "3.0.0"

  override def ivyDeps = Agg(ivy"net.sf.py4j:py4j:0.10.9.2")
}

object stack extends ScalaModule {
  def scalaVersion = "3.0.0"

  override def ivyDeps = Agg(ivy"net.sf.py4j:py4j:0.10.9.2")
}

object listener extends ScalaModule {
  def scalaVersion = "3.0.0"

  override def ivyDeps = Agg(ivy"net.sf.py4j:py4j:0.10.9.2")
}

object javaserver extends ScalaModule {
  def scalaVersion = "3.0.0"

  override def moduleDeps = Seq(core)

  override def ivyDeps = Agg(ivy"net.sf.py4j:py4j:0.10.9.2")
}

object javaclient extends ScalaModule {
  def scalaVersion = "3.0.0"

  override def moduleDeps = Seq(core)

  override def ivyDeps = Agg(ivy"net.sf.py4j:py4j:0.10.9.2")
}

object dynamic extends ScalaModule {
  def scalaVersion = "3.0.0"

  override def moduleDeps = Seq(core)

  override def ivyDeps = Agg(ivy"net.sf.py4j:py4j:0.10.9.2")
}

