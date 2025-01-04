# docker-akcom-udpechod

Docker for running [akcom-udpechod](https://github.com/alaskacommunications/akcom-udpecho) daemon 

## Build

`make build`

## Run

`make run`

## Test

```
$ make test
docker exec -it akcom-udpechod sh -c "akcom-udpecho 127.0.0.1"
UDPECHO 127.0.0.1:30006 (127.0.0.1:30006): 40 bytes
udpecho_seq=1 failures=0 time=0.3 ms delay=0.2 ms adj_time=0.1 ms
udpecho_seq=2 failures=0 time=0.2 ms delay=0.1 ms adj_time=0.1 ms
udpecho_seq=3 failures=0 time=0.2 ms delay=0.1 ms adj_time=0.1 ms
udpecho_seq=4 failures=0 time=0.3 ms delay=0.1 ms adj_time=0.1 ms
--- 127.0.0.1 udpecho statistics ---
4 packets transmitted, 4 packets received, 0.0% packet loss
round-trip min/avg/max = 0.2/0.3/0.3 ms
adjusted round-trip min/avg/max = 0.1/0.1/0.1 ms
```

## See Also

https://github.com/alaskacommunications/akcom-udpecho
