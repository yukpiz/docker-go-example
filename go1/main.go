package main

import (
	"fmt"
	"net/http"
	"os"
	"time"
)

func main() {
	http.HandleFunc("/ping", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(os.Stdout, "accept ping!\n")
		w.WriteHeader(http.StatusOK)
		return
	})
	http.HandleFunc("/stop", func(http.ResponseWriter, *http.Request) {
		fmt.Fprintf(os.Stdout, "accept stop!\n")
		os.Exit(0)
	})
	fmt.Fprintf(os.Stdout, "processing...\n")
	time.Sleep(10 * time.Second)
	http.ListenAndServe(":8080", nil)
}
