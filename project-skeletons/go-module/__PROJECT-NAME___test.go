package __PROJECT-NAME___test

import (
	"testing"

	"__PROJECT-NAME__"
)

func TestHello(t *testing.T) {
	if __PROJECT-NAME__.Hello() != "Hello, World!" {
		t.Error("something went wrong")
	}
}
