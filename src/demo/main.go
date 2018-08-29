package main

import (
	"net/http"
)

type handler struct{}

func (h *handler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("欢迎使用京东云-云翼平台"))
}

func main() {
	http.Handle("/", &handler{})
	http.ListenAndServe(":8088", nil)
}
