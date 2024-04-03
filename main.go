package main

import (
	"log"
	"net/http"
)

func main() {
	mux := http.NewServeMux()
	mux.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		if r.Method != "GET" {
			http.Error(w, "http method not allowed", http.StatusBadRequest)
			return
		}

		text := "Go Basic HTTP Server"

		w.Write([]byte(text))
	})

	server := new(http.Server)
	server.Handler = mux
	server.Addr = "0.0.0.0:443"

	log.Println("Server starting at", server.Addr)
	err := server.ListenAndServeTLS("server.crt", "server.key")
	if err != nil {
		log.Fatal(err.Error())
	}
}
