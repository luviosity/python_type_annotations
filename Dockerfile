FROM python:3.14-slim
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

ENV UV_COMPILE_BYTECODE=1 \
	UV_LINK_MODE=copy \
	UV_NO_DEV=1 \
	UV_PYTHON_DOWNLOADS=0

WORKDIR /app

# Install Python dependencies
RUN --mount=type=cache,target=/root/.cache/uv \
    --mount=type=bind,source=uv.lock,target=uv.lock \
    --mount=type=bind,source=pyproject.toml,target=pyproject.toml \
    uv sync --locked --no-install-project

# Copy project sources
COPY pyproject.toml uv.lock ./
COPY challenge/ ./challenge/

# Activate venv
ENV PATH="/app/.venv/bin:$PATH"

# Run the type check by default
CMD ["mypy", "challenge/"]
