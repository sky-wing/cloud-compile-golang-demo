package main

import (
	"net/http"
)

type handler struct{}

func GetTitle() string {
	return `<h1 align="center">欢迎使用京东云-流水线</h1>`
}

func (h *handler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	title := GetTitle()
	w.Write([]byte(title))
}

func main() {
	http.Handle("/", &handler{})
	http.ListenAndServe(":8088", nil)
}
