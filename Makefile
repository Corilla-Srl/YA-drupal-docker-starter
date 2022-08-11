ifndef SUBFOLDER_NAME
	export SUBFOLDER_NAME=docroot
endif

# Project variables used to populate the .env file for the docker-compose
# All the variables with COMPOSE_ prefix will be added to the .env file
DOTENV_FILE=.env

.PHONY: all generate-folders generate-settings generate-docker-compose generate-tmp-private generate-webpack

# Main target.
all: generate-folders generate-settings generate-docker-compose generate-tmp-private

generate-folders:
	@echo "Generating $(SUBFOLDER_NAME) file..."
	@if [ -d "./$(SUBFOLDER_NAME)" ]; then \
		echo "$(SUBFOLDER_NAME) folder already generated"; \
	else \
		mkdir $(SUBFOLDER_NAME); \
		ls -A | grep -v $(SUBFOLDER_NAME) | xargs mv -t $(SUBFOLDER_NAME); \
		echo "$(SUBFOLDER_NAME) folder generated"; \
    fi
	@echo ""

generate-settings:
	@echo "Moving settings.php file in the right position"
	@if [ ! -f "./$(SUBFOLDER_NAME)/web/sites/default/settings.php" ]; then \
        mkdir -p ./$(SUBFOLDER_NAME)/web/sites/default/; \
        cp ./$(SUBFOLDER_NAME)/dev/settings.php ./$(SUBFOLDER_NAME)/web/sites/default; \
        echo "File settings moved!"; \
    fi
	@echo ""

generate-docker-compose:
	@echo "Moving settings.php file in the right position"
	@if [ ! -f "./docker-compose.yml" ]; then \
        cp ./$(SUBFOLDER_NAME)/dev/docker-compose.yml ./; \
        echo "File docer-compose moved!"; \
    fi
	@echo ""

generate-tmp-private:
	@echo "Creating tmp and private fodlers"
	@if [ ! -f "./tmp" ]; then \
        mkdir ./$(SUBFOLDER_NAME)/tmp \
		chmod 777 ./$(SUBFOLDER_NAME)/tmp \
        echo "Folder tmp created!"; \
    fi
	@if [ ! -f "./private" ]; then \
        mkdir ./$(SUBFOLDER_NAME)/private \
		chmod 777 ./$(SUBFOLDER_NAME)/private \
        echo "Folder tmp created!"; \
    fi
	@echo ""

generate-webpack:
	@echo "installing webpack folder"
	@git clone git@bitbucket.org:corilla/webpack-starter.git $(FOLDER)
	@sudo rm -r $(FOLDER)/.git
