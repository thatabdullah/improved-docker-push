## overview:
a workflow that validates whether the docker image encountered any change before pulling it from remote registry by comparing the image digest of local image with remote image’s. If they’re identical pulling will be skipped to minimize workflow’s duration. 

## the effect of pulling and pushing

### workflow duration when image was pulled
![image](https://github.com/user-attachments/assets/25d86dca-7372-4073-8fb6-5ffb7ddec58f)

**workflow duration when pulling was skipped**
![image](https://github.com/user-attachments/assets/d3558716-38c6-4767-9ce0-6deb01087e79)

## Result
avoiding the unnecessary pulls reduced 84% of the time required (could reduce more for larger docker images)
