import sys
from os.path import dirname, join, abspath
sys.path.insert(0, abspath(join(dirname(__file__), '..')))
import grpc
import pb.reverse_pb2_grpc as grpcpb2
import pb.reverse_pb2 as pb2


def run():
    channel = grpc.insecure_channel('localhost:50051')
    client = grpcpb2.ReverseServiceStub(channel)
    response = client.ReverseString(pb2.ReverseRequest(data='Hello, World'))
    print("Reverse client received: {0}".format(response.reversed))


run()
