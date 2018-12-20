#clone source
git clone git@bitbucket.org:brodev/chatbot-rasa.git
git clone git@github.com:Beeketing/rasa_core.git
git clone git@github.com:Beeketing/rasa_nlu.git

# install rasa_core
cd rasa_core
pip install -r requirements.txt
pip install .

cd ..

#install rasa_nlu
cd rasa_nlu
pip install -r requirements.txt
pip install .

cd ..

# install additional lib
pip install tensorflow-hub
python -m spacy download en 

# training model
cd chatbot-rasa
make clean
make train-nlu
make train-core

# run application

nohup make action-server 2>action-server.log &
nohup make nlg 2>nlg.log &
nohup make cmdline 2>cmdline.log &