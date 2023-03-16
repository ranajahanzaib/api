package main

import (
	"github.com/gofiber/fiber/v2"
	"github.com/ranajahanzaib/api/handlers"
)

func setupRoutes(app *fiber.App) {

	app.Get("/", handlers.Hello)
}
