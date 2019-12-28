#!/bin/bash

mkdir $(pwd)/csharp-grpc-client/pb;
mkdir $(pwd)/python-grpc-client/pb;
mkdir $(pwd)/golang-grpc-client/pb;
mkdir $(pwd)/golang-grpc-server/pb;
protoc -I=proto proto/reverse.proto --go_out=plugins=grpc:golang-grpc-server/pb --go_out=plugins=grpc:golang-grpc-client/pb;
python -m grpc_tools.protoc -I proto/ --python_out=python-grpc-client/pb --grpc_python_out=python-grpc-client/pb proto/reverse.proto;
$(path_to_sharp_protoc)./protoc -I=proto/ --csharp_out=csharp-grpc-client/pb --grpc_out=csharp-grpc-client/pb proto/reverse.proto --plugin=protoc-gen-grpc=$(path_to_grpc_csharp_plugin)./grpc_csharp_plugin;