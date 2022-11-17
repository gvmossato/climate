# 🍂 Climate

Projeto desenvolvido para a disciplina **PTC3567 — Ciência dos Dados em Automação e Engenharia** da Poli-USP buscando estudar a evolução histórica do aquecimento global e sua relação com a concentração média de gás carbônico global. A análise foi conduzida com dados oriundos de distintas fontes e em volume massivo, sob a pretensão de entender o panorâma histórico e elaborar predições a cerca do panorâma futuro, com o auxílio de algorítimos de Inteligêcia Artifical.

# 🧙 Colaboradores

A realização desse projeto foi possível por meio do trabalho de:

* Gabriel Trellesse
* [Gabriel Mossato](https://github.com/gvmossato)
* [Juliana Kodono](https://github.com/julianakodono)

# 💽 Datasets

Duas foram as principais fontes de dados:

* [Climate Change: Earth Surface Temperature Data](https://www.kaggle.com/datasets/berkeleyearth/climate-change-earth-surface-temperature-data), um dataset público disponibilizado através do Kaggle que em sua versão mais discretizada possui aproximadamente **8.6 milhões de registros**, que contemplam leituras mensais desde 1750 até 2013, localizadas por latitude e longitude.

* [Global monthly distributions of atmospheric CO2 concentrations under the historical and future scenarios](https://zenodo.org/record/5021361), disponibilizado via Zenodo, o dataset histórico utilizado conta com **127 milhões de registros**, são dados que partem de 1850 indo até 2013 e fazem um mapeamento com 1 grau de discretização, em latitude e longitude.

# 📁 Estrutura

O repositório encontra-se organizado como abaixo:

```
📁 src
├── 📁 integrate
│   ├── 📁 data
│   ├── 📁 out
│   ├── 🐍 convert.ipynb
│   ├── 🐍 parse.ipynb
│   └── 🐍 integrate.ipynb
└── 📁 analisys
    ├── 📁 data
    └── 🐍 explore.ipynb
```

No diretório `integrate` existem os notebooks utilizados para fazer a integração dos datasets, que envolve:

1. A conversão de NetCDF para CSV;
2. O *parsing* das tabelas para adequação de suas colunas entre cada fonte; 
3. A junção de fato das tabelas.

Além disso, os dados de entrada são sempre colocados nas pastas `data` e, quando existem, os dados de saída são salvos em `out`. Finalmente, `analisys` apresenta o processo de análise desses dados previamente tratados e integrados.

# 📦 Dependências

O detalhamento das dependências encontra-se em [`requirements.txt`](https://github.com/gvmossato/climate/blob/main/requirements.txt), sendo as principais:

* [IPython](https://ipython.org/)
* [PySpark](https://spark.apache.org/docs/latest/api/python/)
* [Xskipper](https://xskipper.io/1.3.0/)
* [Pandas](https://pandas.pydata.org/)
* [Xarray](https://docs.xarray.dev/en/stable/)
* [Plotly](https://plotly.com/python/)

# ⚙️ Instalação

É necessário clonar o repositório:

```
git clone git@github.com:gvmossato/climate.git
```

*(Opcional)* Criar e ativar um ambiente virtual:

```
python -m venv env
```

```
env/Scripts/activate
```

E instalar suas dependências:

```
pip install -r requirements.txt
```

Demais instruções estão listadas no notebook [`src/integrate/parse.ipynb`](https://github.com/gvmossato/climate/blob/main/src/integrate/parse.ipynb) e podem ser necessárias ou não de acordo com o que se prentende executar.
