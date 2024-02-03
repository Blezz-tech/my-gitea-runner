
## build


## push

```bash
docker push gitea.blezz-tech.ru/blezz-tech/actions
```

## run

```bash
docker run -it gitea.blezz-tech.ru/blezz-tech/actions bash
```

## build with nix

```bash
docker load < $(nix-build ./package.nix) && docker run -it gitea.blezz-tech.ru/blezz-tech/actions bash
```


