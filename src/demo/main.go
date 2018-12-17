package main

import (
	"net/http"
)

type handler struct{}

func GetTitle() string {
	return "欢迎使用京东云-云翼平台"
}

func (h *handler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	title := GetTitle()
	w.Write([]byte(title))
}

func main() {
	http.Handle("/", &handler{})
	http.ListenAndServe(":8088", nil)
}
