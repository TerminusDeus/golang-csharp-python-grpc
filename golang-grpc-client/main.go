package main

import (
	"log"

	pb "github.com/TerminusDeus/golang-csharp-python-grpc/proto"

	"golang.org/x/net/context"
	"google.golang.org/grpc"
)

const (
	address = "localhost:50051"
)

func main() {
	conn, err := grpc.Dial(address, grpc.WithInsecure())
	if err != nil {
		log.Fatalf("did not connect: %v", err)
	}

	defer conn.Close()
	c := pb.NewReverseServiceClient(conn)
	r, err := c.ReverseString(context.Background(), &pb.ReverseRequest{
		Data: "Hello, world",
	})

	if err != nil {
		log.Fatalf("could not greet: %v", err)
	}
	log.Println("Reverse client received: ", r.Reversed)
}