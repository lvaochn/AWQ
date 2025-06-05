# 使所有导入都变为可选，避免 flash_attn 等依赖问题

try:
    from .falcon import FalconForCausalLM
except ImportError:
    FalconForCausalLM = None

try:
    from .llama import LlamaForCausalLM
except ImportError:
    LlamaForCausalLM = None

try:
    from .mpt import MPTForCausalLM
except ImportError:
    MPTForCausalLM = None

try:
    from .llava_llama import LlavaLlamaForCausalLM
except ImportError:
    LlavaLlamaForCausalLM = None

try:
    from .qwen2 import Qwen2ForCausalLM
except ImportError:
    Qwen2ForCausalLM = None
