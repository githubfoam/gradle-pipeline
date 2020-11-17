IMAGE := alpine/fio
APP:="scripts/usernetes-containerd.sh"

deploy-cakephp:
	bash scripts/deploy-cakephp.sh

provision-bash-jenkins-ubuntu:
	bash scripts/provision-bash-jenkins-ubuntu.sh

deploy-lua-app:
	bash app/deploy-lua-app.sh
	
push-image:
	docker push $(IMAGE)

.PHONY: deploy-libvirt deploy-vagrant deploy-packer deploy-terraform push-image
