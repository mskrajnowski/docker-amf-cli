# AMF CLI Docker image

[AMF](https://github.com/aml-org/amf) [CLI](https://github.com/aml-org/amf#command-line-usage) in a container

## Usage

```sh
docker run mskrajnowski/amf-cli [AMF_OPTIONS]
```

## Example

Translate RAML 1.0 to OpenAPI 3.0

```sh
docker run \
    --rm \
    --volume "$(realpath example/api):/tmp/example" \
    --workdir /tmp/example \
    mskrajnowski/amf-cli \
    translate api.raml \
    --format-in "RAML 1.0" \
    --media-type-in "application/yaml" \
    --format-out "OAS 3.0" \
    --media-type-out "application/yaml" \
    --resolve 'true'
```
