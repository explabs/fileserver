package main

import (
	"github.com/explabs/ad-ctf-paas-api/pkg/archive"
	"log"
	"net/http"
)

func main() {
	archive.Compress("./tasks", "./archives/tasks.tar.gz")
	http.Handle("/", http.FileServer(http.Dir("./archives")))
	log.Fatal(http.ListenAndServe(":8081", nil))
}
