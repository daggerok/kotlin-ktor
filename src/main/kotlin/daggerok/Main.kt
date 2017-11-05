package daggerok

/*
fun main(args: Array<String>) {
  println("hi!")
}
*/

import io.ktor.application.*
import io.ktor.http.*
import io.ktor.response.*
import io.ktor.routing.*
import io.ktor.server.engine.*
import io.ktor.server.netty.*

fun main(args: Array<String>) {
  val server = embeddedServer(Netty, 8080) {
    routing {
      get("/") {
        //call.respondText("hi, there!", ContentType.Text.Html)
        call.respondText("""
          {
            "message": "hello!"
          }
        """.trimIndent(), ContentType.Text.JavaScript)
      }
    }
  }
  server.start(wait = true)
}
