package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
)

type jsonResponse struct {
	Base  string `json:"base"`
	Date  string `json:"date"`
	Rates struct {
		MYR float64 `json:"MYR"`
	} `json:"rates"`
}

func main() {

	symbols := "MYR"
	base := "SGD"

	// GET the JSON file
	resp, err := http.Get(fmt.Sprintf("http://api.fixer.io/latest?symbols=%s&base=%s", symbols, base))
	if err != nil {
		log.Fatalln(err.Error())
	}

	defer resp.Body.Close()

	b := &jsonResponse{}

	// Read from http response body and decode it into jsonResponse struct
	err = json.NewDecoder(resp.Body).Decode(b)
	if err != nil {
		log.Fatalln(err.Error())
	}

	// Only reason to dereference here is to not print a '&' symbol before the contents of struct

	fmt.Printf("%s 1 = %s %f\n", base, symbols, b.Rates.MYR)
}
