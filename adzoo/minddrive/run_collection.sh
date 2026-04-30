#!/bin/bash
set -e
export PYTHONPATH="${PWD}"
export PYTHONPATH="/home/tangzhenyu/01-soft/01-research/09-Carla/04-CARLA0.9.15MindDrive/PythonAPI:${PYTHONPATH}"
export PYTHONPATH="/home/tangzhenyu/01-soft/01-research/09-Carla/04-CARLA0.9.15MindDrive/PythonAPI/carla:${PYTHONPATH}"
export PYTHONPATH="rl_projects/:${PYTHONPATH}"
export PYTHONPATH="rl_projects/scenario_runner:${PYTHONPATH}"

export TORCH_DISTRIBUTED_DEBUG="INFO"
export CARLA_ROOT="/home/tangzhenyu/01-soft/01-research/09-Carla/04-CARLA0.9.15MindDrive"
export CARLA_SERVER="/home/tangzhenyu/01-soft/01-research/09-Carla/04-CARLA0.9.15MindDrive/CarlaUE4.sh"
export SCENARIO_RUNNER_ROOT="rl_projects/scenario_runner"
export DEBUG_SHOW_PRED="1"

export PYTHONPATH="/home/tangzhenyu/01-soft/01-research/09-Carla/04-CARLA0.9.15MindDrive/PythonAPI/carla:${PYTHONPATH}"

export PORT=$1
export TM_PORT=$2
export REPETITIONS=1 # multiple evaluation runs

# TCP evaluation
export ROUTES=$3
export CHECKPOINT_ENDPOINT=$4
export SAVE_PATH=$5
export GPU_RANK=$6
export CONFIG=$7
echo -e "GPU_RANK: $GPU_RANK"
CUDA_VISIBLE_DEVICES=${GPU_RANK} python adzoo/minddrive/rollout.py \
    ${CONFIG} \
    --routes=${ROUTES} \
    --checkpoint=${CHECKPOINT_ENDPOINT} \
    --port=${PORT} \
    --traffic_manager_port=${TM_PORT} \
    --repetitions=${REPETITIONS} \
    --resume \
    --use_carla